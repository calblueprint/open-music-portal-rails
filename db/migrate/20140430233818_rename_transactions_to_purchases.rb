class RenameTransactionsToPurchases < ActiveRecord::Migration
  def change
    rename_table :transactions, :purchases
  end
end
