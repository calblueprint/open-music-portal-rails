  class Admin::UsersController < Admin::BaseController

    def show
      @user = User.find(params[:id])
    end
  end
