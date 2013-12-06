class Day < ActiveRecord::Base
  belongs_to :competition
  has_many :events
end
