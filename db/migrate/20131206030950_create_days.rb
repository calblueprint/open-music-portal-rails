class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.belongs_to :competition
      t.date :date

      t.timestamps
    end
  end
end
