class AddIsCurrentToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :is_current, :boolean
  end
end
