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
#

class Competition < ActiveRecord::Base
  has_many :days
  has_many :categories
  has_and_belongs_to_many :users

  scope :active, -> { where(is_current: true) }

  def display_name
    "#{name} - #{year}"
  end

  def display_events
    categories.collect{ |category| category.display_events }
  end

end
