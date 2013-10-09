class AddLocationInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone_number, :string
  end
end
