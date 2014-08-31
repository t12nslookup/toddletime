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

ActiveRecord::Schema.define(version: 20140831180213) do

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

  create_table "carer_to_meets", force: true do |t|
    t.integer  "carer_id"
    t.integer  "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carer_to_meets", ["carer_id"], name: "index_carer_to_meets_on_carer_id", using: :btree
  add_index "carer_to_meets", ["meet_id"], name: "index_carer_to_meets_on_meet_id", using: :btree

  create_table "carers", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "can_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "postcode"
    t.integer  "how_heard_id"
    t.string   "other_header"
  end

  add_index "carers", ["how_heard_id"], name: "index_carers_on_how_heard_id", using: :btree

  create_table "child_to_meets", force: true do |t|
    t.integer  "child_id"
    t.integer  "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "child_to_meets", ["child_id"], name: "index_child_to_meets_on_child_id", using: :btree
  add_index "child_to_meets", ["meet_id"], name: "index_child_to_meets_on_meet_id", using: :btree

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

  create_table "how_heards", force: true do |t|
    t.string   "location_name"
    t.integer  "expired",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leader_meet_types", force: true do |t|
    t.integer  "leader_id"
    t.integer  "meet_type_id"
    t.integer  "expired",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leader_meet_types", ["leader_id"], name: "index_leader_meet_types_on_leader_id", using: :btree
  add_index "leader_meet_types", ["meet_type_id"], name: "index_leader_meet_types_on_meet_type_id", using: :btree

  create_table "leader_to_meets", force: true do |t|
    t.integer  "meet_id"
    t.integer  "leader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leader_to_meets", ["leader_id"], name: "index_leader_to_meets_on_leader_id", using: :btree
  add_index "leader_to_meets", ["meet_id"], name: "index_leader_to_meets_on_meet_id", using: :btree

  create_table "leaders", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.date     "expired"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dbs"
  end

  create_table "meet_type_jobs", force: true do |t|
    t.integer  "job_id"
    t.integer  "meet_type_id"
    t.integer  "count",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meet_type_jobs", ["job_id"], name: "index_meet_type_jobs_on_job_id", using: :btree
  add_index "meet_type_jobs", ["meet_type_id"], name: "index_meet_type_jobs_on_meet_type_id", using: :btree

  create_table "meet_types", force: true do |t|
    t.string   "name"
    t.integer  "deleted",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meets", force: true do |t|
    t.date     "meet_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meet_type_id"
  end

  add_index "meets", ["meet_type_id"], name: "index_meets_on_meet_type_id", using: :btree

  create_table "rota_leaders", force: true do |t|
    t.integer  "leader_id"
    t.integer  "job_id"
    t.integer  "meet_id"
    t.boolean  "expired",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rota_leaders", ["job_id"], name: "index_rota_leaders_on_job_id", using: :btree
  add_index "rota_leaders", ["leader_id"], name: "index_rota_leaders_on_leader_id", using: :btree
  add_index "rota_leaders", ["meet_id"], name: "index_rota_leaders_on_meet_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "approved",               default: false, null: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
