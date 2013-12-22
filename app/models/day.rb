# == Schema Information
#
# Table name: days
#
#  id             :integer          not null, primary key
#  competition_id :integer
#  date           :date
#  created_at     :datetime
#  updated_at     :datetime
#

class Day < ActiveRecord::Base
  belongs_to :competition
  has_many :events

  def name
    date.to_time.strftime('%B %e')
  end
end
