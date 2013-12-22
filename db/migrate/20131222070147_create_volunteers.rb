class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|

      t.timestamps
    end
  end
end
