# == Schema Information
#
# Table name: display_events
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  max_time    :integer
#  num_pieces  :integer
#  price       :integer          default(0), not null
#

class DisplayEvent < ActiveRecord::Base
  belongs_to :category
  has_many :events

  has_and_belongs_to_many :pieces
  has_and_belongs_to_many :transactions

  has_many :display_events_users
  has_many :users, through: :display_events_users

  validates :name, presence: true
  validates :num_pieces, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :max_time, presence: true, numericality: { only_integer: true, greater_than: 0 }

  after_create :create_default_event

  def add_contestants(contestants)
    contestants.each do |contestant|
      add_contestant(contestant)
    end
  end

  def add_contestant(contestant)
    event = self.event_with_fewest_contestants
    event.users << contestant
  end

  def event_with_fewest_contestants
    sorted_events_by_contestants_count.first
  end

  def sorted_events_by_contestants_count
    events.sort_by{ |event| event.contestants.count }.reverse
  end

  def create_default_event
    events << Event.create
  end

end
