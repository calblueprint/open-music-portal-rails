# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :text
#  created_at     :datetime
#  updated_at     :datetime
#  start_time     :time
#  room_id        :integer
#  competition_id :integer
#  max_time       :integer
#

class Event < ActiveRecord::Base
  belongs_to :competition
  belongs_to :room
  has_many :events_users
  has_many :users, :through => :events_users
  has_many :comments

  has_and_belongs_to_many :pieces
  has_and_belongs_to_many :transactions

  validates :name, presence: true, uniqueness: true

  def self.to_json(events)
    return events.collect {|event| event.to_json}
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
