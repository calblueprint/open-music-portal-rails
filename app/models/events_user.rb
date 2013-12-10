# == Schema Information
#
# Table name: events_users
#
#  id       :integer          not null, primary key
#  event_id :integer          not null
#  user_id  :integer          not null
#  paid     :boolean          default(FALSE)
#  rank     :integer
#

class EventsUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  def to_json
    return {
      encid: id,
      event_id: event_id,
      user_id: user_id,
      rank: rank
    }
  end

end
