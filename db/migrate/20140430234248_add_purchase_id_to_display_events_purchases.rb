class AddPurchaseIdToDisplayEventsPurchases < ActiveRecord::Migration
  def change
    remove_column :display_events_purchases, :transaction_id
    add_column :display_events_purchases, :purchase_id, :integer
  end
end
