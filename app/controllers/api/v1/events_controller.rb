module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json

      def index
        @events = Event.all
        render json: {events: Event.to_json(@events)}
      end
    end
  end
end
