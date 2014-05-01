# == Schema Information
#
# Table name: display_events_purchases
#
#  display_event_id :integer
#  purchase_id      :integer
#

class DisplayEventsPurchase < ActiveRecord::Base
  belongs_to :display_event
  belongs_to :purchase
end
