class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users, id: false do |t|
      t.references :event, :null => false
      t.references :user, :null => false
    end
  end
end
