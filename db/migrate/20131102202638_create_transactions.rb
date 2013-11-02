class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, :null => false
      t.integer :amount

      t.boolean :charged
      t.datetime :charged_at
      t.text :stripe_charge_id

      t.timestamps
    end
  end
end
