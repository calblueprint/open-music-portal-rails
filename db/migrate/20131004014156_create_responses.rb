class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :code
      t.integer :status
      t.string :message
      t.boolean :success

      t.timestamps
    end
  end
end
