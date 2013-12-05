class AddRankToEventsUsers < ActiveRecord::Migration
  def change
    add_column :events_users, :rank, :integer
  end
end
