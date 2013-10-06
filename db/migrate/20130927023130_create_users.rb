class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :id_number
      t.date :date_of_birth
      t.string :email
      t.string :country
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number

      t.timestamps
    end
  end
end