# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  amount           :integer          not null
#  charged          :boolean          default(FALSE)
#  charged_at       :datetime
#  stripe_charge_id :text
#  created_at       :datetime
#  updated_at       :datetime
#

class Purchase < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :display_events

  validates :user, :presence => true
  validates :amount, :presence => true, :numericality => {:greater_than => 0}

  def self.calculate_charge_amount(display_events)
    total = 0
    display_events.each do |de|
      total += de.price
    end
    return total
  end

  def self.create_for_user_and_display_events(user, display_events)
    amount = calculate_charge_amount(display_events)
    t = Purchase.create(user: user, amount: amount)
    t.display_events.concat(display_events)
    return t
  end
end
