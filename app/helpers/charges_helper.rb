module ChargesHelper
  def transaction_amount_string(transaction)
    number_to_currency(transaction.amount / 100.0)
  end
end
