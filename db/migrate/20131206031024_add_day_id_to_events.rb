class AddDayIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :day_id, :integer
  end
end
