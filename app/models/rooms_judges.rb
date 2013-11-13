class RoomsJudges < ActiveRecord::Base
  belongs_to :judge
  belongs_to :room
end
