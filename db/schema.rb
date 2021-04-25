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

ActiveRecord::Schema.define(version: 2021_04_16_143826) do

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

  create_table "allocations", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "client_rate_cents", default: 0, null: false
    t.string "client_rate_currency", default: "USD", null: false
    t.integer "user_rate_cents", default: 0, null: false
    t.string "user_rate_currency", default: "USD", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_allocations_on_project_id"
    t.index ["user_id"], name: "index_allocations_on_user_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "account_number"
    t.string "account_holder_name"
    t.integer "code_type"
    t.string "code"
    t.string "branch_name"
    t.string "resource_type", null: false
    t.bigint "resource_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_type", "resource_id"], name: "index_bank_accounts_on_resource_type_and_resource_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "identities", force: :cascade do |t|
    t.integer "identity_type", null: false
    t.string "value", null: false
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_type", "resource_id"], name: "index_identities_on_resource_type_and_resource_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "repo_url"
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.integer "quote_amount_cents", default: 0, null: false
    t.string "quote_amount_currency", default: "USD", null: false
    t.integer "order_amount_cents", default: 0, null: false
    t.string "order_amount_currency", default: "USD", null: false
    t.index ["owner_type", "owner_id"], name: "index_projects_on_owner"
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

  create_table "work_times", force: :cascade do |t|
    t.bigint "allocation_id", null: false
    t.date "work_date"
    t.integer "hours"
    t.integer "minutes"
    t.float "computed_hours"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["allocation_id"], name: "index_work_times_on_allocation_id"
  end

  add_foreign_key "allocations", "projects"
  add_foreign_key "allocations", "users"
  add_foreign_key "work_times", "allocations"
end
