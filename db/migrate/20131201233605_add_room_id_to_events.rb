class AddRoomIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :room_id, :integer
  end
end
