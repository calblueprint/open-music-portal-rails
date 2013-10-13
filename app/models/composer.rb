# == Schema Information
#
# Table name: composers
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

class Composer < ActiveRecord::Base
  has_many :pieces

  validates :name, presence: true
end
