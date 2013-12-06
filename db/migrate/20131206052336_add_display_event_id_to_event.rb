class AddDisplayEventIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :display_event_id, :integer
  end
end
