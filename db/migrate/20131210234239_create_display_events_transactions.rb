class CreateDisplayEventsTransactions < ActiveRecord::Migration
  def change
    create_table :display_events_transactions, :id => false do |t|
      t.belongs_to :display_event
      t.belongs_to :transaction
    end
  end
end
