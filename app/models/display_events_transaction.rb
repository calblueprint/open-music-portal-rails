# == Schema Information
#
# Table name: display_events_transactions
#
#  display_event_id :integer
#  transaction_id   :integer
#

class DisplayEventsTransaction < ActiveRecord::Base
  belongs_to :display_event
  belongs_to :transaction
end
