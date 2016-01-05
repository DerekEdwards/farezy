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

ActiveRecord::Schema.define(version: 20160105025210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name",                                    null: false
    t.text     "note"
    t.string   "image_url"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "font_color_hex", default: "#FFFFFF",      null: false
    t.string   "card_name",      default: "transit card", null: false
    t.string   "map_url"
  end

  create_table "day_passes", force: :cascade do |t|
    t.integer  "city_id"
    t.float    "cost",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "days",       default: 1, null: false
  end

  create_table "fares", force: :cascade do |t|
    t.integer  "city_id"
    t.float    "cost",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
