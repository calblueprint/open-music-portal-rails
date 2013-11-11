class EventRank < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :judge

  validates :rank, presence:true
  validates_associated :event, :user, :judge
end