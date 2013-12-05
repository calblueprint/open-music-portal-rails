class AddIndexesToModels < ActiveRecord::Migration
  def change
    add_index :announcements, :admin_id, unique: true

    add_index :comments, :judge_id
    add_index :comments, :contestant_id
    add_index :comments, :event_id

    add_index :events, :room_id, unique: true

    add_index :events_judges, :event_id, unique: true
    add_index :events_judges, :judge_id, unique: true

    add_index :events_pieces, :event_id
    add_index :events_pieces, :piece_id

    add_index :events_transactions, :event_id, unique: true
    add_index :events_transactions, :transaction_id, unique: true

    add_index :events_users, :event_id
    add_index :events_users, :user_id

    add_index :pieces, :composer_id
    add_index :pieces, :nationality_id
    add_index :pieces, :book_id
    add_index :pieces, :publisher_id
    add_index :pieces, :period_id
    add_index :pieces, :level_id
  end
end
