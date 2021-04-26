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

ActiveRecord::Schema.define(version: 2021_04_26_045110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "address_type"
    t.boolean "primary", default: false
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.string "area"
    t.string "city", null: false
    t.string "district"
    t.string "state"
    t.string "country", null: false
    t.string "pincode", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "contact_numbers", force: :cascade do |t|
    t.integer "contact_type", null: false
    t.string "number", null: false
    t.string "note"
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contact_numbers_on_contactable_type_and_contactable_id"
  end

  create_table "email_addresses", force: :cascade do |t|
    t.integer "email_type", null: false
    t.string "email", null: false
    t.string "emailable_type"
    t.bigint "emailable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emailable_type", "emailable_id"], name: "index_email_addresses_on_emailable_type_and_emailable_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name", null: false
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vacant_gen_beds"
    t.integer "occupied_gen_beds"
    t.integer "vacant_o2_beds"
    t.integer "occupied_o2_beds"
    t.integer "vacant_icu_beds"
    t.integer "occupied_icu_beds"
    t.integer "vacant_ventilators"
    t.integer "occupied_ventilators"
  end

  create_table "identities", force: :cascade do |t|
    t.integer "identity_type", null: false
    t.string "value", null: false
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_type", "resource_id"], name: "index_identities_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
