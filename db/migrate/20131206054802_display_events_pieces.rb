class DisplayEventsPieces < ActiveRecord::Migration
  def change
    create_table :display_events_pieces, :id => false do |t|
      t.belongs_to :display_event
      t.belongs_to :piece
    end
  end
end
