class DisplayEventsUser < ActiveRecord::Base
  self.primary_key = "user_id"

  belongs_to :user
  belongs_to :display_event
end
