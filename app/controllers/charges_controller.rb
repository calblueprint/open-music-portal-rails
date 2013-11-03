class ChargesController < ApplicationController
  def new
    user = current_user
    events = user.events.where(paid: false)
    @transaction = Transaction.create_for_user_and_events(user, events)
  end

  def create
    @transaction = Transaction.find(params[:transaction_id])
    if @transaction.charged
      flash[:error] = "This transaction has already been paid."
      redirect_to charges_path
    end
    user = current_user
    if user != @transaction.user
      # failure
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

    ActiveRecord::Base.transaction do
      @transaction.charged = true
      @transaction.charged_at = DateTime.now
      @transaction.stripe_charge_id = charge.id
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
