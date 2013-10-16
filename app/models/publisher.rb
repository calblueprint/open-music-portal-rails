# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

class Publisher < ActiveRecord::Base
  has_many :pieces

  validates :name, presence: true, uniqueness: true
end
