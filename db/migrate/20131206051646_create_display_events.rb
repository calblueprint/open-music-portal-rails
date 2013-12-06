class CreateDisplayEvents < ActiveRecord::Migration
  def change
    create_table :display_events do |t|
      t.belongs_to :category
      t.string :name

      t.timestamps
    end
  end
end
