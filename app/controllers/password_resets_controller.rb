class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:password_reset][:email].downcase)
    user.send_password_reset if user
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(password_reset_user_params)
      redirect_to root_url, :notice => "Password successfully reset. You can now log in with your new password."
    else
      render :edit
    end
  end

  private
    def password_reset_user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
