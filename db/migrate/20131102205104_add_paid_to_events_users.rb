class AddPaidToEventsUsers < ActiveRecord::Migration
  def change
    add_column :events_users, :paid, :boolean, default: false
  end
end
