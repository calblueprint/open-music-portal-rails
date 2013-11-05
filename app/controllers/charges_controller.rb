class ChargesController < ApplicationController
  def new
    user = current_user
    events = user.events.where("events_users.paid" => false)
    if events.empty?
      flash[:error] = "Nothing to pay for!"
      @transaction = nil
    else
      @transaction = Transaction.create_for_user_and_events(user, events)
    end
  end

  def create
    @transaction = Transaction.find(params[:transaction_id])
    if @transaction.charged
      flash[:error] = "This transaction has already been paid."
      redirect_to charges_path
    end
    user = current_user
    if user != @transaction.user
      flash[:error] = "Wrong user"
      redirect_to charges_path
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
      @transaction.charged_at = DateTime.now
      @transaction.stripe_charge_id = charge.id
      @transaction.save

      @transaction.events.each do |e|
        eu = EventsUser.find_by(event: e, user: @transaction.user)
        eu.paid = true
        eu.save
      end
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
