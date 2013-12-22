# == Schema Information
#
# Table name: display_events_users
#
#  display_event_id :integer
#  user_id          :integer          primary key
#  paid             :boolean          default(FALSE), not null
#

class DisplayEventsUser < ActiveRecord::Base
  self.primary_key = "user_id"

  belongs_to :user
  belongs_to :display_event
end
