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

ActiveRecord::Schema.define(version: 2019_06_11_232136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "comments", force: :cascade do |t|
    t.string "by"
    t.text "body"
    t.string "tracking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tracking_id"], name: "index_comments_on_tracking_id", unique: true
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

  create_table "shipments", force: :cascade do |t|
    t.string "tracking_id"
    t.string "ship_from"
    t.string "ship_to"
    t.string "pickup"
    t.string "deadline"
    t.boolean "ontime"
    t.boolean "completed"
    t.boolean "delayed"
    t.text "cargo"
    t.string "utilization"
    t.text "quote_basis"
    t.decimal "quote_complete"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_from"], name: "index_shipments_on_ship_from"
    t.index ["ship_to"], name: "index_shipments_on_ship_to"
    t.index ["tracking_id"], name: "index_shipments_on_tracking_id", unique: true
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
