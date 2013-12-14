class Admin::UsersController < Admin::BaseController

    def show
      @user = User.find(params[:id])
    end

    def index
      @users = User.paginate(:page => params[:page], :per_page => 10).order('id ASC')
    end

    def edit
      @events = Event.all
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.attributes = user_params
      @user.save(validate:false)
      redirect_to @user
    end

  private

    def  user_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                     :date_of_birth, :country, :street_address, :city, :state, :zip_code,
                                     :phone_number, :event_ids => [])
    end

end
