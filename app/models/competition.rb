# == Schema Information
#
# Table name: competitions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  year       :integer
#  location   :string(255)
#  venue      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  is_current :boolean
#

class Competition < ActiveRecord::Base
  has_many :days
  has_many :categories
  has_and_belongs_to_many :users

  scope :active, -> { where(is_current: true) }

  validates_presence_of :name, :year, :location, :venue

  def display_name
    "#{name} - #{year}"
  end

  def display_events
    categories.collect{ |category| category.display_events }.flatten
  end

  def events
    display_events.collect{ |display_event| display_event.events }.flatten
  end

  def hours
    (1..24).collect{ |num| "#{num}:00" }
  end

end
