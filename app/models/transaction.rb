class Transaction < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :events

  validates :user, :presence => true
  validates :amount, :presence => true, :numericality => {:greater_than => 0}

  def calculate_charge_amount(events)
    return 100 * events.length
  end

  def create_for_user_and_events(user, events)
    amount = calculate_charge_amount(events)
    t = Transaction.create(user: user, amount: amount)
    t.events.concat(events)
    return t
  end
end
