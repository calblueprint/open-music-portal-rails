class AddPieceToEventsUsers < ActiveRecord::Migration
  def change
    add_column :events_users, :piece_id, :integer
    EventsUser.all.each do |eu|
      eu.piece_id = 1
      eu.save!
    end
    change_column :events_users, :piece_id, :integer, null: false
  end
end
