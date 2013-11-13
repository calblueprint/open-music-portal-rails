class CreateEventRanks < ActiveRecord::Migration
  def change
    create_table :event_ranks do |t|
      t.integer :rank

      t.timestamps
    end
  end
end
