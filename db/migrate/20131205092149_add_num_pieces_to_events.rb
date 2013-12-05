class AddNumPiecesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :num_pieces, :integer
  end
end
