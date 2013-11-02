class Transaction < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :events

  validates :user, presence: true
end
