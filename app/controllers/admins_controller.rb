class AdminsController < ApplicationController
  before_action :admin_user

  def show
  end

  def users
    @users = User.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def user_edit
    @events = Event.all
    @user = User.find(params[:id])
  end

  def user_update
    @user = User.find(params[:id])
    @user.attributes = user_params
    @user.save(validate:false)
    redirect_to @user
  end

  private

    def admin_user
      redirect_to(root_url) unless current_user != nil and current_user.has_role? :admin
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                   :date_of_birth, :country, :street_address, :city, :state, :zip_code,
                                   :phone_number)
    end

end
