class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome back to USOMC, #{user.first_name}!"
      if user.has_admin_dashboard_access?
        redirect_to admin_dashboard_path
      else
        redirect_to profile_path
      end
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
