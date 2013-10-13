# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

class Period < ActiveRecord::Base
  has_many :pieces

  validates :name, presence: true
end
