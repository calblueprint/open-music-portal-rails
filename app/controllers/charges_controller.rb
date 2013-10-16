class ChargesController < ApplicationController
  def new
    @user = current_user
    @amount = calculate_event_charges(@user)
  end

  def create
    user = current_user
    @amount = calculate_event_charges(user)
    customer = Stripe::Customer.create(
      :email => user.email,
      :card => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :currency => 'usd',
      :description => 'Test charge'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
