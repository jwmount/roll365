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

ActiveRecord::Schema.define(version: 2019_03_17_225022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "post_code"
    t.string "map_reference"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "credit_terms"
    t.boolean "PO_required"
    t.boolean "active"
    t.string "bookkeeping_number"
    t.string "line_of_business"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.text "verbiage"
    t.string "indication"
    t.boolean "status"
    t.boolean "approved"
    t.string "change_approved_by"
    t.datetime "change_approved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name", limit: 60
    t.integer "company_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifiers", force: :cascade do |t|
    t.string "identifiable_type"
    t.bigint "identifiable_id"
    t.string "name"
    t.string "value"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifiable_type", "identifiable_id"], name: "index_identifiers_on_identifiable_type_and_identifiable_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "materialable_type"
    t.bigint "materialable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["materialable_type", "materialable_id"], name: "index_materials_on_materialable_type_and_materialable_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "company_id"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "role"
    t.boolean "available"
    t.datetime "available_on"
    t.boolean "OK_to_contact"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tips", force: :cascade do |t|
    t.string "name"
    t.integer "company_id"
    t.decimal "fee"
    t.string "fire_ant_risk_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
