class AddConfirmationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmed, :boolean, default: false
    add_column :users, :confirmation_token, :string
  end
end
