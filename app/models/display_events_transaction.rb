class DisplayEventsTransaction < ActiveRecord::Base
  belongs_to :display_event
  belongs_to :transaction
end
