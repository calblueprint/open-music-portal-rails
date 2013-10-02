class CreateComposers < ActiveRecord::Migration
  def change
    create_table :composers do |t|
      t.text :name

      t.timestamps
    end
  end
end
