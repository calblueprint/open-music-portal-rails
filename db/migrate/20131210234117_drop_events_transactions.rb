class DropEventsTransactions < ActiveRecord::Migration
  def change
    drop_table :events_transactions
  end
end
