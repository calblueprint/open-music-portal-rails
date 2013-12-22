class CreateSuperUsers < ActiveRecord::Migration
  def change
    create_table :super_users do |t|

      t.timestamps
    end
  end
end
