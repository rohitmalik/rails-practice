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

ActiveRecord::Schema[8.0].define(version: 2026_09_10_181317) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "advisor_certifications", force: :cascade do |t|
    t.bigint "advisor_id", null: false
    t.bigint "certification_id", null: false
    t.date "issued_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_advisor_certifications_on_advisor_id"
    t.index ["certification_id"], name: "index_advisor_certifications_on_certification_id"
  end

  create_table "advisors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.bigint "firm_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firm_id"], name: "index_advisors_on_firm_id"
    t.index ["phone"], name: "index_advisors_on_phone"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "advisor_id", null: false
    t.bigint "client_id", null: false
    t.datetime "appointment_date"
    t.string "status"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_appointments_on_advisor_id"
    t.index ["client_id"], name: "index_appointments_on_client_id"
  end

  create_table "certifications", force: :cascade do |t|
    t.string "name"
    t.string "issuing_organization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.bigint "advisor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_clients_on_advisor_id"
  end

  create_table "firms", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "advisor_certifications", "advisors"
  add_foreign_key "advisor_certifications", "certifications"
  add_foreign_key "advisors", "firms"
  add_foreign_key "appointments", "advisors"
  add_foreign_key "appointments", "clients"
  add_foreign_key "clients", "advisors"
end
