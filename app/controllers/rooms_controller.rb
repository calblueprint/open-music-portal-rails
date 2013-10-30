class RoomsController < ApplicationController
  before_action :admin_user,    only: :new
  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render 'new';
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  private

    def room_params
      params.require(:room).permit(:name)
    end

    def admin_user
      redirect_to(root_url) unless current_user != nil and current_user.has_role? :admin
    end
end
