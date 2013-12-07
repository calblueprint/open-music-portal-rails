class AddPriceToDisplayEvents < ActiveRecord::Migration
  def change
    add_column :display_events, :price, :integer
  end
end
