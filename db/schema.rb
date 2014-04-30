# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140430233818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", force: true do |t|
    t.text     "description"
    t.integer  "admin_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "announcements", ["admin_id"], name: "index_announcements_on_admin_id", unique: true, using: :btree

  create_table "books", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.integer  "competition_id"
    t.string   "name"
    t.integer  "age_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "body"
    t.integer  "judge_id"
    t.integer  "contestant_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["contestant_id"], name: "index_comments_on_contestant_id", using: :btree
  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["judge_id"], name: "index_comments_on_judge_id", using: :btree

  create_table "competitions", force: true do |t|
    t.string   "name"
    t.integer  "year"
    t.string   "location"
    t.string   "venue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_current"
    t.datetime "open_date"
    t.datetime "first_late_date"
    t.datetime "second_late_date"
    t.datetime "close_date"
    t.boolean  "closed"
    t.integer  "open_registration_fee"
    t.integer  "first_late_registration_fee"
    t.integer  "second_late_registration_fee"
  end

  create_table "competitions_users", force: true do |t|
    t.integer "competition_id"
    t.integer "user_id"
  end

  add_index "competitions_users", ["competition_id"], name: "index_competitions_users_on_competition_id", using: :btree
  add_index "competitions_users", ["user_id"], name: "index_competitions_users_on_user_id", using: :btree

  create_table "composers", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contestants", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.integer  "competition_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "display_events", force: true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_time"
    t.integer  "num_pieces"
    t.integer  "price",       default: 0, null: false
  end

  create_table "display_events_pieces", id: false, force: true do |t|
    t.integer "display_event_id"
    t.integer "piece_id"
  end

  create_table "display_events_transactions", id: false, force: true do |t|
    t.integer "display_event_id"
    t.integer "transaction_id"
  end

  create_table "display_events_users", id: false, force: true do |t|
    t.integer "display_event_id"
    t.integer "user_id"
    t.boolean "paid",             default: false, null: false
  end

  create_table "event_ranks", force: true do |t|
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "start_time"
    t.integer  "room_id"
    t.integer  "competition_id"
    t.boolean  "closed"
    t.integer  "day_id"
    t.integer  "display_event_id"
  end

  add_index "events", ["competition_id"], name: "index_events_on_competition_id", unique: true, using: :btree
  add_index "events", ["room_id"], name: "index_events_on_room_id", using: :btree

  create_table "events_judges", force: true do |t|
    t.integer "event_id"
    t.integer "judge_id"
  end

  add_index "events_judges", ["event_id"], name: "index_events_judges_on_event_id", unique: true, using: :btree
  add_index "events_judges", ["judge_id"], name: "index_events_judges_on_judge_id", unique: true, using: :btree

  create_table "events_users", force: true do |t|
    t.integer "event_id", null: false
    t.integer "user_id",  null: false
    t.integer "rank"
    t.integer "piece_id"
  end

  add_index "events_users", ["event_id"], name: "index_events_users_on_event_id", using: :btree
  add_index "events_users", ["user_id"], name: "index_events_users_on_user_id", using: :btree

  create_table "judges", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nationalities", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pieces", force: true do |t|
    t.integer  "composer_id"
    t.integer  "nationality_id"
    t.text     "title"
    t.integer  "book_id"
    t.integer  "publisher_id"
    t.text     "affiliate_link"
    t.integer  "length_minutes"
    t.integer  "length_seconds"
    t.integer  "period_id"
    t.text     "pages"
    t.integer  "level_id"
    t.text     "other_a"
    t.text     "other_b"
    t.text     "other_c"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pieces", ["book_id"], name: "index_pieces_on_book_id", using: :btree
  add_index "pieces", ["composer_id"], name: "index_pieces_on_composer_id", using: :btree
  add_index "pieces", ["level_id"], name: "index_pieces_on_level_id", using: :btree
  add_index "pieces", ["nationality_id"], name: "index_pieces_on_nationality_id", using: :btree
  add_index "pieces", ["period_id"], name: "index_pieces_on_period_id", using: :btree
  add_index "pieces", ["publisher_id"], name: "index_pieces_on_publisher_id", using: :btree

  create_table "publishers", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer  "user_id",                          null: false
    t.integer  "amount",                           null: false
    t.boolean  "charged",          default: false
    t.datetime "charged_at"
    t.text     "stripe_charge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "super_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "id_number"
    t.date     "date_of_birth"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "country"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone_number"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "confirmed",              default: false
    t.string   "confirmation_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "volunteers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "website_admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
