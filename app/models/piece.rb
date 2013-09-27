class Piece < ActiveRecord::Base
  belongs_to :composer
  belongs_to :nationality
  belongs_to :book
  belongs_to :publisher
  belongs_to :period
  belongs_to :level
end
