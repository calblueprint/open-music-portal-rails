class DisplayEventsController < ApplicationController

  def index
    @display_events = DisplayEvent.paginate(:page => params[:page], :per_page => 10).order('id ASC')
  end

  def show
    @display_event = DisplayEvent.find(params[:id])

    @user = nil
    if signed_in?
      @user = current_user
    end
  end

end
