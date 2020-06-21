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

ActiveRecord::Schema.define(version: 2020_06_21_162530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carer_to_children", id: :serial, force: :cascade do |t|
    t.integer "child_id"
    t.integer "carer_id"
    t.string "relationship", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["carer_id"], name: "index_carer_to_children_on_carer_id"
    t.index ["child_id"], name: "index_carer_to_children_on_child_id"
  end

  create_table "carer_to_how_contacts", force: :cascade do |t|
    t.bigint "carer_id", null: false
    t.bigint "how_contact_id", null: false
    t.integer "expired", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carer_id"], name: "index_carer_to_how_contacts_on_carer_id"
    t.index ["expired"], name: "index_carer_to_how_contacts_on_expired"
    t.index ["how_contact_id"], name: "index_carer_to_how_contacts_on_how_contact_id"
  end

  create_table "carer_to_meets", id: :serial, force: :cascade do |t|
    t.integer "carer_id"
    t.integer "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["carer_id"], name: "index_carer_to_meets_on_carer_id"
    t.index ["meet_id"], name: "index_carer_to_meets_on_meet_id"
  end

  create_table "carers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.integer "can_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "postcode"
    t.bigint "how_heard_id"
    t.string "other_heard"
    t.bigint "how_contact_id"
    t.bigint "what_contact_id"
    t.index ["how_contact_id"], name: "index_carers_on_how_contact_id"
    t.index ["how_heard_id"], name: "index_carers_on_how_heard_id"
    t.index ["what_contact_id"], name: "index_carers_on_what_contact_id"
  end

  create_table "child_to_meets", id: :serial, force: :cascade do |t|
    t.integer "child_id"
    t.integer "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["child_id"], name: "index_child_to_meets_on_child_id"
    t.index ["meet_id"], name: "index_child_to_meets_on_meet_id"
  end

  create_table "children", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "gender", limit: 255
    t.date "date_of_birth"
    t.string "address", limit: 255
    t.string "postcode", limit: 255
    t.string "medical_conditions", limit: 255
    t.string "special_needs", limit: 255
    t.date "registered_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "emergency_contact"
  end

  create_table "how_contacts", id: :serial, force: :cascade do |t|
    t.string "contact_type"
    t.integer "expired", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "how_heards", id: :serial, force: :cascade do |t|
    t.string "location_name", limit: 255
    t.integer "expired", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leader_meet_types", id: :serial, force: :cascade do |t|
    t.integer "leader_id"
    t.integer "meet_type_id"
    t.integer "expired", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["leader_id"], name: "index_leader_meet_types_on_leader_id"
    t.index ["meet_type_id"], name: "index_leader_meet_types_on_meet_type_id"
  end

  create_table "leader_to_meets", id: :serial, force: :cascade do |t|
    t.integer "meet_id"
    t.integer "leader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["leader_id"], name: "index_leader_to_meets_on_leader_id"
    t.index ["meet_id"], name: "index_leader_to_meets_on_meet_id"
  end

  create_table "leaders", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.date "expired"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "dbs"
  end

  create_table "meet_type_jobs", id: :serial, force: :cascade do |t|
    t.integer "job_id"
    t.integer "meet_type_id"
    t.integer "count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["job_id"], name: "index_meet_type_jobs_on_job_id"
    t.index ["meet_type_id"], name: "index_meet_type_jobs_on_meet_type_id"
  end

  create_table "meet_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "deleted", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meets", id: :serial, force: :cascade do |t|
    t.date "meet_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "meet_type_id"
    t.index ["meet_type_id"], name: "index_meets_on_meet_type_id"
  end

  create_table "rota_leaders", id: :serial, force: :cascade do |t|
    t.integer "leader_id"
    t.integer "job_id"
    t.integer "meet_id"
    t.boolean "expired", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["job_id"], name: "index_rota_leaders_on_job_id"
    t.index ["leader_id"], name: "index_rota_leaders_on_leader_id"
    t.index ["meet_id"], name: "index_rota_leaders_on_meet_id"
  end

  create_table "send_emails", id: :serial, force: :cascade do |t|
    t.string "addresses"
    t.string "subject"
    t.string "body"
    t.integer "meet_type_id"
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delivered_at"
    t.index ["meet_type_id"], name: "index_send_emails_on_meet_type_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "username", limit: 255
    t.boolean "approved", default: false, null: false
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "what_contacts", force: :cascade do |t|
    t.string "contact_type"
    t.integer "expired", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carer_to_children", "carers", name: "fk_carer_to_child_carer"
  add_foreign_key "carer_to_children", "children", name: "fk_carer_to_child_child"
  add_foreign_key "carer_to_how_contacts", "carers"
  add_foreign_key "carer_to_how_contacts", "how_contacts"
  add_foreign_key "carer_to_meets", "carers", name: "fk_carer_to_meet_carer"
  add_foreign_key "carer_to_meets", "meets", name: "fk_carer_to_meet_meet"
  add_foreign_key "carers", "how_contacts", name: "fk_carer_to_how_contact"
  add_foreign_key "carers", "how_heards", name: "fk_carer_to_how_heard"
  add_foreign_key "carers", "what_contacts", name: "fk_carer_to_what_contact"
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
