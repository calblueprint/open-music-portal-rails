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

class Transaction < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :events

  validates :user, :presence => true
  validates :amount, :presence => true, :numericality => {:greater_than => 0}

  def self.calculate_charge_amount(events)
    return 100 * events.length # TODO: fill in real price
  end

  def self.create_for_user_and_events(user, events)
    amount = calculate_charge_amount(events)
    t = Transaction.create(user: user, amount: amount)
    t.events.concat(events)
    return t
  end
end
