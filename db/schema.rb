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

ActiveRecord::Schema.define(version: 20140507101820) do

  create_table "comments", force: true do |t|
    t.integer  "member_id"
    t.integer  "event_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "society_id"
    t.integer  "group_id"
    t.string   "name"
    t.string   "type"
    t.datetime "time"
    t.string   "location"
    t.string   "webpage"
    t.string   "condition"
    t.text     "description"
    t.string   "status"
    t.string   "string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.integer  "group_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_societies", id: false, force: true do |t|
    t.integer "groups_id"
    t.integer "societies_id"
  end

  create_table "joins", force: true do |t|
    t.integer  "member_id"
    t.integer  "society_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.integer  "student_id"
    t.integer  "phone"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.integer  "event_id"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societies", force: true do |t|
    t.string   "name"
    t.integer  "register_num"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "event_id"
    t.decimal  "price"
    t.string   "purchase_location"
    t.datetime "strat_time"
    t.datetime "valid_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
