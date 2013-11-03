class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, :null => false
      t.integer :amount, :null => false

      t.boolean :charged, :default => false
      t.datetime :charged_at
      t.text :stripe_charge_id

      t.timestamps
    end
  end
end
