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

ActiveRecord::Schema.define(version: 20151014152742) do

  create_table "bar_locations", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "city"
    t.string  "state"
    t.string  "contact"
    t.string  "phone"
    t.string  "email"
    t.string  "beer"
    t.string  "format"
    t.integer "price"
  end

  create_table "checks", force: :cascade do |t|
    t.integer  "trail_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "checktype"
  end

  add_index "checks", ["location_id"], name: "index_checks_on_location_id"
  add_index "checks", ["trail_id"], name: "index_checks_on_trail_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "body"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "kennels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "location"
    t.text     "rules"
    t.string   "website"
    t.integer  "state_id"
  end

  add_index "kennels", ["state_id"], name: "index_kennels_on_state_id"

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "place_type"
    t.string   "place_id"
  end

  add_index "locations", ["place_id", "place_type"], name: "index_locations_on_place_id_and_place_type"

  create_table "outdoor_locations", force: :cascade do |t|
    t.string "name"
    t.float  "longitude"
    t.float  "latitude"
    t.string "city"
    t.string "state"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "body"
    t.integer  "poster_id"
    t.string   "poster_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "posttype"
  end

  add_index "posts", ["poster_type", "poster_id"], name: "index_posts_on_poster_type_and_poster_id"

  create_table "relationships", force: :cascade do |t|
    t.integer "followable_id"
    t.string  "followable_type"
    t.integer "user_id"
  end

  add_index "relationships", ["followable_type", "followable_id"], name: "index_relationships_on_followable_type_and_followable_id"
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trails", force: :cascade do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "kennel_id"
    t.integer  "price"
    t.text     "description"
  end

  add_index "trails", ["kennel_id"], name: "index_trails_on_kennel_id"
  add_index "trails", ["user_id"], name: "index_trails_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
