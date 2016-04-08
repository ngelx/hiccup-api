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

ActiveRecord::Schema.define(version: 20160408135121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "intineraries", force: :cascade do |t|
    t.integer  "trip_id",        null: false
    t.string   "start_location"
    t.string   "end_location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "water"
    t.integer  "hammok"
    t.boolean  "fishing"
    t.string   "forecast"
  end

  add_index "intineraries", ["trip_id"], name: "index_intineraries_on_trip_id", using: :btree

  create_table "local_contacts", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.string  "name",    null: false
    t.string  "email"
    t.string  "phone"
  end

  add_index "local_contacts", ["trip_id"], name: "index_local_contacts_on_trip_id", using: :btree

  create_table "shares", force: :cascade do |t|
    t.integer "trip_id",            null: false
    t.string  "public_url",         null: false
    t.string  "private_url"
    t.string  "password_encrypted"
  end

  add_index "shares", ["trip_id"], name: "index_shares_on_trip_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "organizator"
    t.datetime "start_date",          null: false
    t.datetime "end_date",            null: false
    t.string   "start_location"
    t.string   "end_location"
    t.text     "goal"
    t.string   "route"
    t.string   "transportation"
    t.string   "comunication"
    t.string   "freak_out"
    t.string   "in_reach_map"
    t.string   "agency"
    t.string   "fees"
    t.string   "stove_fuel"
    t.string   "transportation_time"
    t.text     "direction_out"
    t.text     "condition_caution"
    t.text     "animal_caution"
    t.text     "plant_caution"
    t.text     "fly_issue"
    t.string   "supermarket"
    t.string   "outdoor_store"
  end

end
