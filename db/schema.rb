# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_25_070106) do

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "hospital_id"
    t.integer "doctor_id"
    t.integer "patient_id"
    t.datetime "time"
    t.index ["doctor_id"], name: "index_bookings_on_doctor_id"
    t.index ["hospital_id"], name: "index_bookings_on_hospital_id"
    t.index ["patient_id"], name: "index_bookings_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "email"
    t.string "phone"
  end

  create_table "hospitals", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "address"
  end

  create_table "patient_tokens", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "patient_id"
    t.string "token"
    t.index ["patient_id"], name: "index_patient_tokens_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.boolean "active"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "hospital_id"
    t.integer "doctor_id"
    t.string "day"
    t.string "time"
    t.index ["doctor_id"], name: "index_schedules_on_doctor_id"
    t.index ["hospital_id"], name: "index_schedules_on_hospital_id"
  end

  add_foreign_key "bookings", "doctors"
  add_foreign_key "bookings", "hospitals"
  add_foreign_key "bookings", "patients"
  add_foreign_key "patient_tokens", "patients"
  add_foreign_key "schedules", "doctors"
  add_foreign_key "schedules", "hospitals"
end
