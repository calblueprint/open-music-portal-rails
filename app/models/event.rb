# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  start_time       :time
#  room_id          :integer
#  competition_id   :integer
#  closed           :boolean
#  day_id           :integer
#  display_event_id :integer
#

class Event < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search, associated_against: {
                             display_event: :name,
                             room: :name
                           },
                           using: {tsearch: {prefix: true, normalization: 2}}

  belongs_to :day
  belongs_to :room
  belongs_to :display_event

  has_many :events_users
  has_many :users, through: :events_users
  has_many :comments

  def name
    display_event.name
  end

  def full_name
    "#{name} - #{category.name}"
  end

  def display_name
    "#{name} from #{category.name}"
  end

  def length
    return 120
  end

  def competition
    display_event.category.competition
  end

  def category
    display_event.category
  end

  def num_pieces
    display_event.num_pieces
  end

  def max_time
    display_event.max_time
  end

  def price
    display_event.price
  end

  def self.to_json(events)
    return events.collect {|event| event.to_json}
  end

  def competition
    day.competition
  end

  def contestants
    users.with_role(:contestant)
  end

  def judges
    users.with_role(:judge)
  end

  def comments_for_contestant_by_judge(contestant, judge)
    comments.where(judge_id: judge.id, contestant_id: contestant.id)
  end

  def to_json
    return {
      encid: id,
      name: name,
      room_number: room.blank? ? '' : room.name,
      judges: User.to_json(judges),
      contestants: User.to_json(contestants)
    }
  end

end
