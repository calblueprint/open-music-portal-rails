module Api
  module V1
    class RoomsController < ApplicationController
      respond_to :json

      def index
        @rooms = Room.all
        render json: {rooms: Room.to_json(@users)}
      end
    end
  end
end
