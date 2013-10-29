class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :description
      t.belongs_to :admin
      t.datetime :date

      t.timestamps
    end
  end
end
