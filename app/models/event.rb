# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :pieces
  has_and_belongs_to_many :transactions

  validates :name, presence: true, uniqueness: true
end