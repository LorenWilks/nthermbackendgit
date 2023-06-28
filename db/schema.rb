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

ActiveRecord::Schema[7.0].define(version: 2023_06_09_192419) do
  create_table "leads", force: :cascade do |t|
    t.string "record_type"
    t.string "profile_group"
    t.string "customer_name"
    t.string "service_address_1"
    t.string "service_address_2"
    t.string "service_city"
    t.string "service_state"
    t.string "service_postal_code"
    t.string "billing_address_1"
    t.string "billing_address_2"
    t.string "billing_city"
    t.string "billing_state"
    t.string "billing_postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_name", "service_address_1", "service_city", "service_state", "service_postal_code"], name: "unique_lead", unique: true
  end

  create_table "operating_companies", force: :cascade do |t|
    t.integer "record_type"
    t.string "date_of_file"
    t.string "LDC_name"
    t.string "file_from_date"
    t.string "file_to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_delivery_points", force: :cascade do |t|
    t.integer "record_type"
    t.string "profile_group"
    t.string "customer_name"
    t.string "service_address_1"
    t.string "service_address_2"
    t.string "service_city"
    t.string "service_state"
    t.string "service_postal_code"
    t.string "billing_address_1"
    t.string "billing_address_2"
    t.string "billing_city"
    t.string "billing_state"
    t.string "billing_postal_code"
    t.string "billing_country_code"
    t.string "EDU_tariff_code"
    t.string "EDU_tariff_description"
    t.string "rider"
    t.string "monthly_billing_date_from"
    t.string "monthly_billing_date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "operating_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
