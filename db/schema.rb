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

ActiveRecord::Schema.define(version: 20160930155625) do

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

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                               null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                          null: false
    t.string   "scopes"
    t.string   "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree
  end

  create_table "oauth_providers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider"], name: "index_oauth_providers_on_provider", using: :btree
    t.index ["user_id"], name: "index_oauth_providers_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.integer  "height_cm"
    t.integer  "weight_kg"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email",           null: false
    t.string   "password_digest"
  end

  create_table "wod_items", force: :cascade do |t|
    t.integer  "wod_id"
    t.integer  "reps"
    t.integer  "men_weight_kg"
    t.integer  "women_weight_kg"
    t.integer  "time_seconds"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "movement_id",     null: false
    t.index ["movement_id"], name: "index_wod_items_on_movement_id", using: :btree
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
    t.integer  "rounds"
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

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_grants", "users", column: "resource_owner_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id"
  add_foreign_key "oauth_providers", "users"
  add_foreign_key "wod_items", "movements"
  add_foreign_key "wod_items", "wods"
  add_foreign_key "wods", "users", column: "author_id"
  add_foreign_key "workouts", "wods"
end
