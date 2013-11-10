class UsersController < ApplicationController 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the USOMC!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def my_profile
    if signed_in?
      @user = current_user
      render 'show'
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                   :date_of_birth, :country, :street_address, :city, :state, :zip_code,
                                   :phone_number)
    end
end
