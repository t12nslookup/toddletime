# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_200_623_174_616) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'carer_to_children', force: :cascade do |t|
    t.bigint 'child_id'
    t.bigint 'carer_id'
    t.string 'relationship'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['carer_id'], name: 'index_carer_to_children_on_carer_id'
    t.index ['child_id'], name: 'index_carer_to_children_on_child_id'
  end

  create_table 'carer_to_how_contacts', force: :cascade do |t|
    t.bigint 'carer_id', null: false
    t.bigint 'how_contact_id', null: false
    t.integer 'expired', default: 0, null: false
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['carer_id'], name: 'index_carer_to_how_contacts_on_carer_id'
    t.index ['expired'], name: 'index_carer_to_how_contacts_on_expired'
    t.index ['how_contact_id'], name: 'index_carer_to_how_contacts_on_how_contact_id'
  end

  create_table 'carer_to_meets', force: :cascade do |t|
    t.bigint 'carer_id'
    t.bigint 'meet_id'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['carer_id'], name: 'index_carer_to_meets_on_carer_id'
    t.index ['meet_id'], name: 'index_carer_to_meets_on_meet_id'
  end

  create_table 'carers', force: :cascade do |t|
    t.string 'name'
    t.string 'phone'
    t.string 'email'
    t.integer 'can_contact'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.string 'address'
    t.string 'postcode'
    t.bigint 'how_heard_id'
    t.string 'other_heard'
    t.bigint 'how_contact_id'
    t.bigint 'what_contact_id'
    t.index ['how_contact_id'], name: 'index_carers_on_how_contact_id'
    t.index ['how_heard_id'], name: 'index_carers_on_how_heard_id'
    t.index ['what_contact_id'], name: 'index_carers_on_what_contact_id'
  end

  create_table 'child_to_meets', force: :cascade do |t|
    t.bigint 'child_id'
    t.bigint 'meet_id'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['child_id'], name: 'index_child_to_meets_on_child_id'
    t.index ['meet_id'], name: 'index_child_to_meets_on_meet_id'
  end

  create_table 'children', force: :cascade do |t|
    t.string 'name'
    t.string 'gender'
    t.date 'date_of_birth'
    t.string 'address'
    t.string 'postcode'
    t.string 'medical_conditions'
    t.string 'special_needs'
    t.date 'registered_date'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.string 'emergency_contact'
  end

  create_table 'how_contacts', force: :cascade do |t|
    t.string 'contact_type'
    t.integer 'expired', default: 0
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
  end

  create_table 'how_heards', force: :cascade do |t|
    t.string 'location_name'
    t.integer 'expired', default: 0
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
  end

  create_table 'jobs', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
  end

  create_table 'leader_meet_types', force: :cascade do |t|
    t.bigint 'leader_id'
    t.bigint 'meet_type_id'
    t.integer 'expired', default: 0
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['leader_id'], name: 'index_leader_meet_types_on_leader_id'
    t.index ['meet_type_id'], name: 'index_leader_meet_types_on_meet_type_id'
  end

  create_table 'leader_to_meets', force: :cascade do |t|
    t.bigint 'meet_id'
    t.bigint 'leader_id'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['leader_id'], name: 'index_leader_to_meets_on_leader_id'
    t.index ['meet_id'], name: 'index_leader_to_meets_on_meet_id'
  end

  create_table 'leaders', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.date 'expired'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.date 'dbs'
  end

  create_table 'meet_type_jobs', force: :cascade do |t|
    t.bigint 'job_id'
    t.bigint 'meet_type_id'
    t.integer 'count', default: 0
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['job_id'], name: 'index_meet_type_jobs_on_job_id'
    t.index ['meet_type_id'], name: 'index_meet_type_jobs_on_meet_type_id'
  end

  create_table 'meet_types', force: :cascade do |t|
    t.string 'name'
    t.integer 'deleted', default: 0
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
  end

  create_table 'meets', force: :cascade do |t|
    t.date 'meet_date'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.bigint 'meet_type_id'
    t.index ['meet_type_id'], name: 'index_meets_on_meet_type_id'
  end

  create_table 'rota_leaders', force: :cascade do |t|
    t.bigint 'leader_id'
    t.bigint 'job_id'
    t.bigint 'meet_id'
    t.boolean 'expired', default: false
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['job_id'], name: 'index_rota_leaders_on_job_id'
    t.index ['leader_id'], name: 'index_rota_leaders_on_leader_id'
    t.index ['meet_id'], name: 'index_rota_leaders_on_meet_id'
  end

  create_table 'send_emails', force: :cascade do |t|
    t.string 'addresses'
    t.string 'subject'
    t.string 'body'
    t.bigint 'meet_type_id'
    t.integer 'state', default: 0
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.datetime 'delivered_at', precision: nil
    t.index ['meet_type_id'], name: 'index_send_emails_on_meet_type_id'
  end

  create_table 'send_texts', force: :cascade do |t|
    t.string 'addresses'
    t.string 'message'
    t.bigint 'meet_type_id'
    t.integer 'state', default: 0
    t.datetime 'delivered_at', precision: nil
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['meet_type_id'], name: 'index_send_texts_on_meet_type_id'
    t.index ['state'], name: 'index_send_texts_on_state'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at', precision: nil
    t.datetime 'remember_created_at', precision: nil
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at', precision: nil
    t.datetime 'last_sign_in_at', precision: nil
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at', precision: nil
    t.datetime 'confirmation_sent_at', precision: nil
    t.datetime 'locked_at', precision: nil
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.string 'username'
    t.boolean 'approved', default: false, null: false
    t.index ['approved'], name: 'index_users_on_approved'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  create_table 'what_contacts', force: :cascade do |t|
    t.string 'contact_type'
    t.integer 'expired', default: 0
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
  end

  add_foreign_key 'carer_to_children', 'carers', name: 'fk_carer_to_child_carer'
  add_foreign_key 'carer_to_children', 'children', name: 'fk_carer_to_child_child'
  add_foreign_key 'carer_to_how_contacts', 'carers'
  add_foreign_key 'carer_to_how_contacts', 'how_contacts'
  add_foreign_key 'carer_to_meets', 'carers', name: 'fk_carer_to_meet_carer'
  add_foreign_key 'carer_to_meets', 'meets', name: 'fk_carer_to_meet_meet'
  add_foreign_key 'carers', 'how_contacts', name: 'fk_carer_to_how_contact'
  add_foreign_key 'carers', 'how_heards', name: 'fk_carer_to_how_heard'
  add_foreign_key 'carers', 'what_contacts', name: 'fk_carer_to_what_contact'
  add_foreign_key 'child_to_meets', 'children', name: 'fk_child_to_meet_child'
  add_foreign_key 'child_to_meets', 'meets', name: 'fk_child_to_meet_meet'
  add_foreign_key 'leader_meet_types', 'leaders', name: 'fk_leader_meet_type_leader'
  add_foreign_key 'leader_meet_types', 'meet_types', name: 'fk_leader_meet_type_meet_type'
  add_foreign_key 'leader_to_meets', 'leaders', name: 'fk_leader_to_meet_leader'
  add_foreign_key 'leader_to_meets', 'meets', name: 'fk_leader_to_meet_meet'
  add_foreign_key 'meet_type_jobs', 'jobs', name: 'fk_meet_type_job_job'
  add_foreign_key 'meet_type_jobs', 'meet_types', name: 'fk_meet_type_job_meet_type'
  add_foreign_key 'meets', 'meet_types', name: 'fk_meet_to_meet_type'
  add_foreign_key 'rota_leaders', 'jobs', name: 'fk_rota_leader_job'
  add_foreign_key 'rota_leaders', 'leaders', name: 'fk_rota_leader_leader'
  add_foreign_key 'rota_leaders', 'meets', name: 'fk_rota_leader_meet'
  add_foreign_key 'send_emails', 'meet_types'
  add_foreign_key 'send_texts', 'meet_types'
end
