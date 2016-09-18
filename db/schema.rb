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

ActiveRecord::Schema.define(version: 20160918120648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movements", force: :cascade do |t|
    t.string   "name"
    t.integer  "default_kg_men"
    t.integer  "default_kg_women"
    t.integer  "default_reps"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.integer  "height_cm"
    t.integer  "weight_kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wod_items", force: :cascade do |t|
    t.integer  "wod_id"
    t.integer  "reps"
    t.integer  "weight_men"
    t.integer  "weight_women"
    t.integer  "time_seconds"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["wod_id"], name: "index_wod_items_on_wod_id", using: :btree
  end

  create_table "wods", force: :cascade do |t|
    t.text     "comment"
    t.integer  "timecap_seconds"
    t.string   "title"
    t.boolean  "private",         default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "date"
    t.integer  "author_id"
    t.integer  "goal_type"
    t.index ["author_id"], name: "index_wods_on_author_id", using: :btree
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "wod_id"
    t.string   "title"
    t.text     "comment"
    t.integer  "duration_seconds"
    t.integer  "total_reps"
    t.boolean  "completed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["wod_id"], name: "index_workouts_on_wod_id", using: :btree
  end

  add_foreign_key "wod_items", "wods"
  add_foreign_key "wods", "users", column: "author_id"
  add_foreign_key "workouts", "wods"
end
