class AddDatesToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :open_date, :datetime
    add_column :competitions, :first_late_date, :datetime
    add_column :competitions, :second_late_date, :datetime
    add_column :competitions, :close_date, :datetime
  end
end
