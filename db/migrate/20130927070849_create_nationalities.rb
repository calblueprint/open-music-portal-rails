class CreateNationalities < ActiveRecord::Migration
  def change
    create_table :nationalities do |t|
      t.string :name

      t.timestamps
    end
  end
end
