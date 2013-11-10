class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :judge
      t.belongs_to :contestant
      t.belongs_to :event

      t.timestamps
    end
  end
end
