# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Room < ActiveRecord::Base
  has_many :events
  validates :name, presence: true
end
