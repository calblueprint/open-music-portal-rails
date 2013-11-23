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
        judge = User.find(params[:judge_id])
        if not judge.has_role?(:judge)
          render json: Response.bad_request("User #{params[:judge_id]} is not a judge")
        end

        contestant = User.find(params[:contestant_id])
        if not contestant.has_role?(:contestant)
          render json: Response.bad_request("User #{params[:contestant_id]} is not a contestant")
        end

        event = Event.find(params[:event_id])

        Comment.create(judge: judge, contestant: contestant, event: event, body: params[:body])
        render json: Response.ok
      end

      def post_ranking
      end

      def start
        render json: {}
      end

    end
  end
end
