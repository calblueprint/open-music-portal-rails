class DropEventsPiecesTable < ActiveRecord::Migration
  def change
    drop_table :events_pieces
  end
end
