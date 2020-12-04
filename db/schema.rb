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

ActiveRecord::Schema.define(version: 2020_12_04_024159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.boolean "driving?"
    t.boolean "parked?"
    t.bigint "road_id"
    t.index ["road_id"], name: "index_cars_on_road_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "open"
  end

  create_table "roads", force: :cascade do |t|
    t.string "name"
    t.boolean "parking?"
    t.boolean "open?"
    t.datetime "date_created"
    t.integer "lanes"
  end

  create_table "trucks", force: :cascade do |t|
    t.integer "year"
    t.string "make"
    t.string "model"
  end

  add_foreign_key "cars", "roads"
end
