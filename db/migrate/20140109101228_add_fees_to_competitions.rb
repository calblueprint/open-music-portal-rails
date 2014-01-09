class AddFeesToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :open_registration_fee, :integer
    add_column :competitions, :first_late_registration_fee, :integer
    add_column :competitions, :second_late_registration_fee, :integer
  end
end
