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

ActiveRecord::Schema.define(version: 20200126154504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carer_to_children", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "carer_id"
    t.string   "relationship", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carer_to_children", ["carer_id"], name: "index_carer_to_children_on_carer_id", using: :btree
  add_index "carer_to_children", ["child_id"], name: "index_carer_to_children_on_child_id", using: :btree

  create_table "carer_to_meets", force: :cascade do |t|
    t.integer  "carer_id"
    t.integer  "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carer_to_meets", ["carer_id"], name: "index_carer_to_meets_on_carer_id", using: :btree
  add_index "carer_to_meets", ["meet_id"], name: "index_carer_to_meets_on_meet_id", using: :btree

  create_table "carers", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "phone",           limit: 255
    t.string   "email",           limit: 255
    t.integer  "can_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",         limit: 255
    t.string   "postcode",        limit: 255
    t.integer  "how_heard_id"
    t.string   "other_heard",     limit: 255
    t.integer  "how_contact_id"
    t.integer  "what_contact_id"
  end

  add_index "carers", ["how_contact_id"], name: "index_carers_on_how_contact_id", using: :btree
  add_index "carers", ["how_heard_id"], name: "index_carers_on_how_heard_id", using: :btree
  add_index "carers", ["what_contact_id"], name: "index_carers_on_what_contact_id", using: :btree

  create_table "child_to_meets", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "child_to_meets", ["child_id"], name: "index_child_to_meets_on_child_id", using: :btree
  add_index "child_to_meets", ["meet_id"], name: "index_child_to_meets_on_meet_id", using: :btree

  create_table "children", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "gender",             limit: 255
    t.date     "date_of_birth"
    t.string   "address",            limit: 255
    t.string   "postcode",           limit: 255
    t.string   "medical_conditions", limit: 255
    t.string   "special_needs",      limit: 255
    t.date     "registered_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "emergency_contact"
  end

  create_table "how_contacts", force: :cascade do |t|
    t.string   "contact_type"
    t.integer  "expired",      default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "how_heards", force: :cascade do |t|
    t.string   "location_name", limit: 255
    t.integer  "expired",                   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leader_meet_types", force: :cascade do |t|
    t.integer  "leader_id"
    t.integer  "meet_type_id"
    t.integer  "expired",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leader_meet_types", ["leader_id"], name: "index_leader_meet_types_on_leader_id", using: :btree
  add_index "leader_meet_types", ["meet_type_id"], name: "index_leader_meet_types_on_meet_type_id", using: :btree

  create_table "leader_to_meets", force: :cascade do |t|
    t.integer  "meet_id"
    t.integer  "leader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leader_to_meets", ["leader_id"], name: "index_leader_to_meets_on_leader_id", using: :btree
  add_index "leader_to_meets", ["meet_id"], name: "index_leader_to_meets_on_meet_id", using: :btree

  create_table "leaders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.date     "expired"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dbs"
  end

  create_table "meet_type_jobs", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "meet_type_id"
    t.integer  "count",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meet_type_jobs", ["job_id"], name: "index_meet_type_jobs_on_job_id", using: :btree
  add_index "meet_type_jobs", ["meet_type_id"], name: "index_meet_type_jobs_on_meet_type_id", using: :btree

  create_table "meet_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "deleted",                default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meets", force: :cascade do |t|
    t.date     "meet_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meet_type_id"
  end

  add_index "meets", ["meet_type_id"], name: "index_meets_on_meet_type_id", using: :btree

  create_table "rota_leaders", force: :cascade do |t|
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

  create_table "send_emails", force: :cascade do |t|
    t.string   "addresses"
    t.string   "subject"
    t.string   "body"
    t.integer  "meet_type_id"
    t.integer  "state",        default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "send_emails", ["meet_type_id"], name: "index_send_emails_on_meet_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.boolean  "approved",                           default: false, null: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "what_contacts", force: :cascade do |t|
    t.string   "contact_type"
    t.integer  "expired",      default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "carer_to_children", "carers", name: "fk_carer_to_child_carer"
  add_foreign_key "carer_to_children", "children", name: "fk_carer_to_child_child"
  add_foreign_key "carer_to_meets", "carers", name: "fk_carer_to_meet_carer"
  add_foreign_key "carer_to_meets", "meets", name: "fk_carer_to_meet_meet"
  add_foreign_key "carers", "how_heards", name: "fk_carer_to_how_heard"
  add_foreign_key "child_to_meets", "children", name: "fk_child_to_meet_child"
  add_foreign_key "child_to_meets", "meets", name: "fk_child_to_meet_meet"
  add_foreign_key "leader_meet_types", "leaders", name: "fk_leader_meet_type_leader"
  add_foreign_key "leader_meet_types", "meet_types", name: "fk_leader_meet_type_meet_type"
  add_foreign_key "leader_to_meets", "leaders", name: "fk_leader_to_meet_leader"
  add_foreign_key "leader_to_meets", "meets", name: "fk_leader_to_meet_meet"
  add_foreign_key "meet_type_jobs", "jobs", name: "fk_meet_type_job_job"
  add_foreign_key "meet_type_jobs", "meet_types", name: "fk_meet_type_job_meet_type"
  add_foreign_key "meets", "meet_types", name: "fk_meet_to_meet_type"
  add_foreign_key "rota_leaders", "jobs", name: "fk_rota_leader_job"
  add_foreign_key "rota_leaders", "leaders", name: "fk_rota_leader_leader"
  add_foreign_key "rota_leaders", "meets", name: "fk_rota_leader_meet"
  add_foreign_key "send_emails", "meet_types"
end
