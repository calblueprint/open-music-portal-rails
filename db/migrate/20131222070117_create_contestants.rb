class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|

      t.timestamps
    end
  end
end
