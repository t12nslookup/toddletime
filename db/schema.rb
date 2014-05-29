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

ActiveRecord::Schema.define(version: 20140528101359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carer_to_children", force: true do |t|
    t.integer  "child_id"
    t.integer  "carer_id"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carer_to_children", ["carer_id"], name: "index_carer_to_children_on_carer_id", using: :btree
  add_index "carer_to_children", ["child_id"], name: "index_carer_to_children_on_child_id", using: :btree

  create_table "carers", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.boolean  "can_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_to_sessions", force: true do |t|
    t.integer  "child_id"
    t.integer  "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "child_to_sessions", ["child_id"], name: "index_child_to_sessions_on_child_id", using: :btree
  add_index "child_to_sessions", ["session_id"], name: "index_child_to_sessions_on_session_id", using: :btree

  create_table "children", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "postcode"
    t.string   "medical_conditions"
    t.string   "special_needs"
    t.date     "registered_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leader_to_sessions", force: true do |t|
    t.integer  "leader_id"
    t.integer  "job_id"
    t.integer  "session_id"
    t.boolean  "expired",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leader_to_sessions", ["job_id"], name: "index_leader_to_sessions_on_job_id", using: :btree
  add_index "leader_to_sessions", ["leader_id"], name: "index_leader_to_sessions_on_leader_id", using: :btree
  add_index "leader_to_sessions", ["session_id"], name: "index_leader_to_sessions_on_session_id", using: :btree

  create_table "leaders", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.date     "expired"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.date     "session_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
