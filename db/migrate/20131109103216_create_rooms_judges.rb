class CreateRoomsJudges < ActiveRecord::Migration
  def change
    create_table :rooms_judges do |t|
      t.references :room
      t.references :judge
    end
  end
end
