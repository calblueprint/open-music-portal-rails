class Day < ActiveRecord::Base
  belongs_to :competition
  has_many :events

  def name
    date.to_time.strftime('%B %e')
  end
end
