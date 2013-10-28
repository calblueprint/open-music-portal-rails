class RolifyCreateJudges < ActiveRecord::Migration
  def change
    create_table(:judges) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_judges, :id => false) do |t|
      t.references :user
      t.references :judge
    end

    add_index(:judges, :name)
    add_index(:judges, [ :name, :resource_type, :resource_id ])
    add_index(:users_judges, [ :user_id, :judge_id ])
  end
end
