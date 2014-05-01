class Admin::Stats::EventsController < Admin::BaseController
  before_filter :events, only: [:index]

  def index
  end

  private

  def events
    @events = Event.all
  end

end
