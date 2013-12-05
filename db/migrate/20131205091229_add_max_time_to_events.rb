class AddMaxTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :max_time, :integer
  end
end
