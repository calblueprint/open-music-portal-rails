class DisplayEventsUser < ActiveRecord::Base
  belongs_to :display_event
  belongs_to :user
end
