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

ActiveRecord::Schema.define(version: 20150407040239) do

  create_table "auth_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auth_users", ["email"], name: "index_auth_users_on_email", unique: true, using: :btree
  add_index "auth_users", ["reset_password_token"], name: "index_auth_users_on_reset_password_token", unique: true, using: :btree

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
    t.string   "description"
    t.integer  "duration"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "deadline_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "votetype",          default: true
  end

  add_index "events", ["itinerary_id"], name: "index_events_on_itinerary_id", using: :btree

  create_table "group_members", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "isMember",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id", using: :btree
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "itineraries", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id", using: :btree

  create_table "itinerary_invited_groups", force: true do |t|
    t.integer  "itinerary_id"
    t.integer  "group_id"
    t.integer  "privelege"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itinerary_invited_users", force: true do |t|
    t.integer  "itinerary_id"
    t.integer  "user_id"
    t.integer  "privelege"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itinerary_invited_users", ["itinerary_id"], name: "index_itinerary_invited_users_on_itinerary_id", using: :btree
  add_index "itinerary_invited_users", ["user_id"], name: "index_itinerary_invited_users_on_user_id", using: :btree

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
    t.string   "name",                   default: ""
    t.string   "email",                  default: "", null: false
    t.string   "title"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "work",                   default: "", null: false
    t.string   "cell",                   default: "", null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "start"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["event_id"], name: "index_votes_on_event_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
