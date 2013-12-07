class DisplayEventsController < ApplicationController

  def new
    @display_event = DisplayEvent.new
  end

  def create
    @display_event = DisplayEvent.new(display_event_params)
    if @display_event.save
      redirect_to @display_event
    else
      render 'new'
    end
  end

  def index
    @display_events = DisplayEvent.paginate(:page => params[:page], :per_page => 10).order('id ASC')
  end

  def show
    @display_event = DisplayEvent.find(params[:id])
  end

  def edit
    @display_event = DisplayEvent.find(params[:id])
  end

  def update
    @display_event = DisplayEvent.find(params[:id])
    if @display_event.update_attributes(display_event_params)
      flash[:success] = "Event updated"
      redirect_to @display_event
    else
      render 'new'
    end
  end


  private

    def display_event_params
      params.require(:event).permit(:name, :num_pieces, :max_time)
    end

end
