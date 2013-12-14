class Api::V1::EventsController < Api::V1::BaseController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    @events = Event.all
    render json: {events: Event.to_json(@events)}
  end

  def show
    @event = Event.find(params[:event_id])
    render json: {event: @event.to_json}
  end

  def users
    @event = Event.find(params[:event_id])
    render json: {users: User.to_json(@event.users)}
  end

  def comments
    @event = Event.find(params[:event_id])
    @judge = User.find(params[:judge_id])
    @contestant = User.find(params[:contestant_id])
    @comments = @event.comments_for_contestant_by_judge(@contestant, @judge)
    render json: {comments: Comment.to_json(@comments)}
  end

  def rankings
    @event = Event.find(params[:event_id])
    render json: {contestants: User.contestant_to_json(@event)}
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

    comment = Comment.create(judge: judge, contestant: contestant, event: event, body: params[:body])
    render json: {comments: Comment.to_json(event.comments_for_contestant_by_judge(contestant, judge))}
  end

  def post_ranking
    @event = Event.find(params[:event_id])
    rankings = params[:ratings]
    rankings.each do |contestant_hash|
      contestant_id = contestant_hash[:contestant_id]
      rank = contestant_hash[:rank]
      contestant = User.with_role(:contestant).find(contestant_id)
      event_user = contestant.events_users.find_by_event_id(@event.id)
      event_user.rank = rank
      event_user.save
    end
    render json: {contestants: User.contestant_to_json(@event)}
  end

end
