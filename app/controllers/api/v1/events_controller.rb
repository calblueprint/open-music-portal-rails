module Api
  module V1
    class EventsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        @events = Event.all
        render json: {events: Event.to_json(@events)}
      end

      def users
        @event = Event.find(params[:event_id])
        render json: {users: User.to_json(@event.users)}
      end

      def post_comment
      end

      def post_ranking
      end

      def start
        render json: {}
      end

    end
  end
end
