class RemoveMaxTimeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :max_time
    remove_column :events, :num_pieces
  end
end
