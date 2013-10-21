class Room < ActiveRecord::Base
  has_many :users
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
