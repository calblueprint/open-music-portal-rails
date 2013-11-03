class CreateEventsTransactions < ActiveRecord::Migration
  def change
    create_table :events_transactions, id: false do |t|
      t.references :event
      t.references :transaction
    end
  end
end
