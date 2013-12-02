# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#  start_time :time
#

class Event < ActiveRecord::Base
  belongs_to :room
  has_many :events_users
  has_many :users, :through => :events_users
  has_and_belongs_to_many :judges

  has_and_belongs_to_many :pieces
  has_and_belongs_to_many :transactions

  validates :name, presence: true, uniqueness: true

  def self.to_json(events)
    return events.collect {|event| event.to_json}
  end

  def to_json
    return {
      encid: id,
      name: name,
      room_number: room.blank? ? '' : room.name,
      users: User.to_json(users)
    }
  end

end
