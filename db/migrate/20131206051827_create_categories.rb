class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :competition
      t.string :name
      t.integer :age_limit

      t.timestamps
    end
  end
end
