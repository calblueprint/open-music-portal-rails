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

ActiveRecord::Schema.define(version: 20131102205104) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["name", "resource_type", "resource_id"], name: "index_admins_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "admins", ["name"], name: "index_admins_on_name", using: :btree

  create_table "announcements", force: true do |t|
    t.text     "description"
    t.integer  "admin_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "composers", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contestants", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contestants", ["name", "resource_type", "resource_id"], name: "index_contestants_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "contestants", ["name"], name: "index_contestants_on_name", using: :btree

  create_table "events", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_pieces", force: true do |t|
    t.integer "event_id", null: false
    t.integer "piece_id", null: false
  end

  create_table "events_transactions", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "transaction_id"
  end

  create_table "events_users", force: true do |t|
    t.integer "event_id",                 null: false
    t.integer "user_id",                  null: false
    t.boolean "paid",     default: false
  end

  create_table "judges", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "judges", ["name", "resource_type", "resource_id"], name: "index_judges_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "judges", ["name"], name: "index_judges_on_name", using: :btree

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

  create_table "publishers", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "user_id",          null: false
    t.integer  "amount"
    t.boolean  "charged"
    t.datetime "charged_at"
    t.text     "stripe_charge_id"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "users_admins", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "admin_id"
  end

  add_index "users_admins", ["user_id", "admin_id"], name: "index_users_admins_on_user_id_and_admin_id", using: :btree

  create_table "users_contestants", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "contestant_id"
  end

  add_index "users_contestants", ["user_id", "contestant_id"], name: "index_users_contestants_on_user_id_and_contestant_id", using: :btree

  create_table "users_judges", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "judge_id"
  end

  add_index "users_judges", ["user_id", "judge_id"], name: "index_users_judges_on_user_id_and_judge_id", using: :btree

end
