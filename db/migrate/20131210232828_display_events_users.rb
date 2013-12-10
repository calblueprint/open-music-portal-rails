class DisplayEventsUsers < ActiveRecord::Migration
  def change
    create_table :display_events_users, :id => false do |t|
      t.belongs_to :display_event
      t.belongs_to :user
      t.boolean :paid, null: false, default: false
    end
  end
end
