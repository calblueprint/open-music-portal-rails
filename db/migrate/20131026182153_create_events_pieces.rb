class CreateEventsPieces < ActiveRecord::Migration
  def change
    create_table :events_pieces, id: false do |t|
      t.references :event, :null => false
      t.references :piece, :null => false
    end
  end
end
