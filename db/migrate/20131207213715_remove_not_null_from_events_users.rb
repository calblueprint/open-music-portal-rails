class RemoveNotNullFromEventsUsers < ActiveRecord::Migration
  def change
    add_column :events_users, :piece_id, :integer, null: true
  end
end
