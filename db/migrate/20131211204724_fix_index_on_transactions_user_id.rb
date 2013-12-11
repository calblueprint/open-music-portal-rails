class FixIndexOnTransactionsUserId < ActiveRecord::Migration
  def change
    remove_index :transactions, :user_id
    add_index :transactions, :user_id
  end
end
