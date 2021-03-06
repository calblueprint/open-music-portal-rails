class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.competitions << Competition.find(params[:competition_id])
    if @user.save
      sign_in @user
      @user.send_confirmation
      flash[:success] = "Welcome to the USOMC!"
      redirect_to competition_path(@user.competitions.first)
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

  def add_display_event
    if signed_in?
      user = current_user
      display_event = DisplayEvent.find(params[:display_event_id])
      if not user.has_display_event(display_event) and user.confirmed
        user.display_events << display_event
      elsif not user.confirmed
        flash[:success] = "You must confirm your email address before adding events."
      end
      category = display_event.category
      redirect_to competition_category_url(category.competition, category)
    else
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                   :date_of_birth, :country, :street_address, :city, :state, :zip_code,
                                   :phone_number)
    end

    def signed_in_user
      redirect_to new_session_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) or current_user.has_role? :admin
    end
end
