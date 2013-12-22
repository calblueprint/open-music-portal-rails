# == Schema Information
#
# Table name: events_users
#
#  id       :integer          not null, primary key
#  event_id :integer          not null
#  user_id  :integer          not null
#  rank     :integer
#  piece_id :integer
#

class EventsUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end
