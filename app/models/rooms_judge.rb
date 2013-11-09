class RoomsJudge < ActiveRecord::Base
  belongs_to :judge
  belongs_to :room
end
