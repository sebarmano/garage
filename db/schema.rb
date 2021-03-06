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

ActiveRecord::Schema.define(version: 20160818224924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date     "date_on",                null: false
    t.integer  "car_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "duration"
    t.time     "starts_at",              null: false
    t.integer  "job_id"
    t.integer  "status",     default: 0, null: false
    t.text     "note"
  end

  add_index "appointments", ["car_id"], name: "index_appointments_on_car_id", using: :btree
  add_index "appointments", ["job_id"], name: "index_appointments_on_job_id", using: :btree

  create_table "assignment_notes", force: :cascade do |t|
    t.text    "content",       null: false
    t.integer "assignment_id"
    t.string  "status"
  end

  add_index "assignment_notes", ["assignment_id"], name: "index_assignment_notes_on_assignment_id", using: :btree

  create_table "assignments", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "job_type_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "status",         default: 0, null: false
  end

  add_index "assignments", ["appointment_id"], name: "index_assignments_on_appointment_id", using: :btree
  add_index "assignments", ["job_type_id"], name: "index_assignments_on_job_type_id", using: :btree

  create_table "cars", force: :cascade do |t|
    t.string   "brand",       null: false
    t.string   "model",       null: false
    t.string   "color"
    t.integer  "year"
    t.string   "license"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "cars", ["customer_id"], name: "index_cars_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "job_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "job_type_id"
    t.integer  "appointment_id"
    t.integer  "status",         default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "jobs", ["appointment_id"], name: "index_jobs_on_appointment_id", using: :btree
  add_index "jobs", ["job_type_id"], name: "index_jobs_on_job_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.integer  "gid"
    t.integer  "role",                   default: 0,  null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "customer_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["customer_id"], name: "index_users_on_customer_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "appointments", "cars"
  add_foreign_key "appointments", "jobs"
  add_foreign_key "assignment_notes", "assignments"
  add_foreign_key "assignments", "appointments"
  add_foreign_key "assignments", "job_types"
  add_foreign_key "cars", "customers"
  add_foreign_key "jobs", "appointments"
  add_foreign_key "jobs", "job_types"
  add_foreign_key "users", "customers"
end
