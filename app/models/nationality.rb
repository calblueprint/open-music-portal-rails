# == Schema Information
#
# Table name: nationalities
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

class Nationality < ActiveRecord::Base
  has_many :pieces

  validates :name, presence: true, uniqueness: true
end
