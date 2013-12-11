class RemovePaidFromEventsUsers < ActiveRecord::Migration
  def change
    remove_column :events_users, :paid
  end
end
