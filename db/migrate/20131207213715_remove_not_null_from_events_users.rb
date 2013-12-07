class RemoveNotNullFromEventsUsers < ActiveRecord::Migration
  def change
    change_column :events_users, :piece_id, :integer, null: true
  end
end
