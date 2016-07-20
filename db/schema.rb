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

ActiveRecord::Schema.define(version: 20160720093924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administratives", force: :cascade do |t|
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "code"
  end

  create_table "coordinates", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "origin"
    t.string   "last_update"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "coordinates", ["location_id"], name: "index_coordinates_on_location_id", using: :btree

  create_table "health_care_establishments", force: :cascade do |t|
    t.string   "cnes_code"
    t.string   "ibge_code"
    t.string   "company_name"
    t.string   "fantasy_name"
    t.integer  "teaching_activity_id"
    t.integer  "organization_kind_id"
    t.integer  "health_unity_id"
    t.integer  "administrative_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "email"
    t.string   "fax"
    t.string   "phone"
    t.string   "cnpj"
  end

  create_table "health_unities", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "code"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "county"
    t.string   "state",                        limit: 2
    t.string   "region"
    t.string   "zipcode"
    t.string   "district"
    t.string   "street"
    t.string   "street_number"
    t.string   "complement"
    t.integer  "health_care_establishment_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "locations", ["health_care_establishment_id"], name: "index_locations_on_health_care_establishment_id", using: :btree

  create_table "organization_kinds", force: :cascade do |t|
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "code"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "name"
    t.integer  "HealthCareEstablishment_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "teaching_activities", force: :cascade do |t|
    t.string   "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "code"
  end

end
