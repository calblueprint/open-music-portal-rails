class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :year
      t.string :location
      t.string :venue

      t.timestamps
    end
  end
end
