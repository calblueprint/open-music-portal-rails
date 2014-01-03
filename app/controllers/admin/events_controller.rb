class Admin::EventsController < Admin::BaseController
  before_action :admin_user, only: [:edit, :update, :show_comments]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def index
    @events = Event.paginate(:page => params[:page], :per_page => 10).includes(:display_event).order('id ASC')
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'new'
    end
  end

  def show_comments
    @event = Event.find(params[:event_id])
    @contestant = User.find(params[:contestant_id])
    @comments = @event.comments.where(contestant_id: params[:contestant_id]).includes(:judge)
  end

  private

    def event_params
      params.require(:event).permit(:name, :num_pieces, :max_time, :closed)
    end

    def admin_user
      redirect_to(root_url) unless current_user and current_user.has_role? :admin
    end

end
