class EventsController < ApplicationController

  def index
    @events = Event.paginate(:page => params[:page], :per_page => 10).includes(:display_event).order('id ASC')
  end

  def show
    @event = Event.find(params[:id])
  end

  def show_comments
    @event = Event.find(params[:event_id])
    @contestant = User.find(params[:contestant_id])
    @comments = @event.comments.where(contestant_id: params[:contestant_id]).includes(:judge)
  end

end
