class RenameDisplayEventsTransactionsToPurchases < ActiveRecord::Migration
  def change
    rename_table :display_events_transactions, :display_events_purchases
  end
end
