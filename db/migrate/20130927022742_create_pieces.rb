class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.belongs_to :composer
      t.belongs_to :nationality
      t.text :title
      t.belongs_to :book
      t.belongs_to :publisher
      t.text :affiliate_link
      t.integer :length_minutes
      t.integer :length_seconds
      t.belongs_to :period
      t.text :pages
      t.belongs_to :level
      t.text :other_a
      t.text :other_b
      t.text :other_c

      t.timestamps
    end
  end
end
