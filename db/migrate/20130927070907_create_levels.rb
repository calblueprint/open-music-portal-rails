class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.text :name

      t.timestamps
    end
  end
end
