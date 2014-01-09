class AddClosedToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :closed, :boolean
  end
end
