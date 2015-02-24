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

ActiveRecord::Schema.define(version: 20150219175442) do

  create_table "event_invited_groups", force: true do |t|
    t.integer  "event_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_invited_groups", ["event_id"], name: "index_event_invited_groups_on_event_id", using: :btree
  add_index "event_invited_groups", ["group_id"], name: "index_event_invited_groups_on_group_id", using: :btree

  create_table "event_invited_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "responded",  default: false
    t.integer  "privelege"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_time_ranges", force: true do |t|
    t.integer  "event_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_time_ranges", ["event_id"], name: "index_event_time_ranges_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.integer  "itinerary_id"
    t.integer  "duration"
    t.datetime "starttime"
    t.datetime "endtime"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["itinerary_id"], name: "index_events_on_itinerary_id", using: :btree

  create_table "group_members", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "itin_invited_groups", force: true do |t|
    t.integer  "itinerary_id"
    t.integer  "group_id"
    t.integer  "privelege"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itin_invited_users", force: true do |t|
    t.integer  "itinerary_id"
    t.integer  "user_id"
    t.integer  "privelege"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itin_invited_users", ["itinerary_id"], name: "index_itin_invited_users_on_itinerary_id", using: :btree
  add_index "itin_invited_users", ["user_id"], name: "index_itin_invited_users_on_user_id", using: :btree

  create_table "itineraries", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id", using: :btree

  create_table "user_event_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_event_votes", ["event_id"], name: "index_user_event_votes_on_event_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
