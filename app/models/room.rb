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
  has_many :rooms_judges
  has_many :judges, :through => :rooms_judges
  validates :name, presence:true

  def self.to_json(rooms)
    return rooms.collect {|room| room.to_json}
  end

  def to_json
    return {
      name: name
    }
  end
end
