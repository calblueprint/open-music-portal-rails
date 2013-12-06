class AddMaxTimeToDisplayEvents < ActiveRecord::Migration
  def change
    add_column :display_events, :max_time, :integer
    add_column :display_events, :num_pieces, :integer
  end
end
