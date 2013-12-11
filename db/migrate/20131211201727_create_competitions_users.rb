class CreateCompetitionsUsers < ActiveRecord::Migration
  def change
    create_table :competitions_users do |t|
      t.references :competition
      t.references :user
    end

    add_index :competitions_users, :competition_id
    add_index :competitions_users, :user_id
  end
end
