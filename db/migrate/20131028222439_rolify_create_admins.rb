class RolifyCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_admins, :id => false) do |t|
      t.references :user
      t.references :admin
    end

    add_index(:admins, :name)
    add_index(:admins, [ :name, :resource_type, :resource_id ])
    add_index(:users_admins, [ :user_id, :admin_id ])
  end
end
