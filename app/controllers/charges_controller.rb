class ChargesController < ApplicationController

  def new
    if not signed_in?
      redirect_to root_path
    else
      @transaction = nil
      user = current_user
      display_events = user.display_events.where("display_events_users.paid" => false)
      if display_events.empty?
        flash.now[:error] = "Nothing to pay for!"
      else
        @transaction = Transaction.create_for_user_and_display_events(user, display_events)
      end
    end
  end

  def create
    @payment_succeeded = false
    @transaction = Transaction.find(params[:transaction_id])
    if @transaction.charged
      flash.now[:error] = "This transaction has already been paid."
      return
    end
    user = current_user
    if user != @transaction.user
      flash[:error] = "Wrong user"
      return
    end

    customer = Stripe::Customer.create(
      :email => user.email,
      :card => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @transaction.amount,
      :currency => 'usd',
      :description => @transaction.id.to_s
    )

    # if charge succeeds, mark the transaction as completed and
    # mark the user's events as paid
    ActiveRecord::Base.transaction do
      @transaction.charged = true
      @transaction.charged_at = Time.zone.now
      @transaction.stripe_charge_id = charge.id
      @transaction.save

      @transaction.display_events.each do |de|
        eu = DisplayEventsUser.find_by(display_event: de, user: @transaction.user)
        eu.paid = true
        eu.save!
      end
    end
    @payment_succeeded = true

    rescue Stripe::CardError => e
    flash.now[:error] = e.message
  end

end
