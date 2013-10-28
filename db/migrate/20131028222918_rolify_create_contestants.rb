class RolifyCreateContestants < ActiveRecord::Migration
  def change
    create_table(:contestants) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_contestants, :id => false) do |t|
      t.references :user
      t.references :contestant
    end

    add_index(:contestants, :name)
    add_index(:contestants, [ :name, :resource_type, :resource_id ])
    add_index(:users_contestants, [ :user_id, :contestant_id ])
  end
end
