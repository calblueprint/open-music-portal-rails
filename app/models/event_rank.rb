# == Schema Information
#
# Table name: event_ranks
#
#  id         :integer          not null, primary key
#  rank       :integer
#  created_at :datetime
#  updated_at :datetime
#

class EventRank < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :judge

  validates :rank, presence:true
  validates_associated :event, :user, :judge
end
