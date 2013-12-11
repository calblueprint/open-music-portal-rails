class DisplayEventsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :display_event
end
