module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json

      def index
        @events = Event.all
        render json: {events: Event.to_json(@events)}
      end

      def users
        @event = Event.find(params[:event_id])
        render json: {users: User.to_json(@event.users)}
      end

    end
  end
end
