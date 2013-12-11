class RemoveIndexEventsOnRoomId < ActiveRecord::Migration
  def change
    remove_index :events, :room_id
    add_index :events, :room_id
  end
end
