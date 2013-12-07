class AddPriceToDisplayEvents < ActiveRecord::Migration
  def change
    add_column :display_events, :price, :integer, null: false, default: 0
  end
end
