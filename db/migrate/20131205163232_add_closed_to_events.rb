class AddClosedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :closed, :boolean
  end
end
