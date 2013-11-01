class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome back to USOMC, #{user.first_name}!"
      redirect_to profile_path
    else
      flash.now[:danger] = "Invalid email and password combination."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
