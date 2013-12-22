class RolifyCreateSuperUsers < ActiveRecord::Migration
  def change
    create_table(:super_users) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_super_users, :id => false) do |t|
      t.references :user
      t.references :super_user
    end

    add_index(:super_users, :name)
    add_index(:super_users, [ :name, :resource_type, :resource_id ])
    add_index(:users_super_users, [ :user_id, :super_user_id ])
  end
end
