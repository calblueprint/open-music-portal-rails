class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.text :name

      t.timestamps
    end
  end
end
