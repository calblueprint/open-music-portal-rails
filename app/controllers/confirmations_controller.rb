class ConfirmationsController < ApplicationController
  def new
    current_user.send_confirmation if current_user and !current_user.confirmed
  end

  def update
    @user = User.find_by_confirmation_token!(params[:id])
    @user.update_attributes(confirmed: true)
    @user.save(validate: false)
  end
end
