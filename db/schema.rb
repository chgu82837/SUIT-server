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

ActiveRecord::Schema.define(version: 20150822043412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clothing_attrs", force: :cascade do |t|
    t.integer  "clothing_field_id"
    t.string   "value",             default: ""
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "clothing_id"
  end

  create_table "clothing_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "func",       default: "none"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "clothings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "chosen",      default: 0
    t.integer  "recommended", default: 0
  end

  create_table "global_models", force: :cascade do |t|
    t.integer  "tops_type"
    t.integer  "tops_style"
    t.integer  "tops_color"
    t.integer  "bottoms_type"
    t.integer  "bottoms_style"
    t.integer  "bottoms_color"
    t.integer  "priority"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "recommends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "clothing_id"
    t.date     "day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "group"
  end

  create_table "user_choises", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "clothing_id"
    t.integer  "liked",       default: 0
    t.datetime "time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "user_models", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tops_type"
    t.integer  "tops_style"
    t.integer  "tops_color"
    t.integer  "bottoms_type"
    t.integer  "bottoms_style"
    t.integer  "bottoms_color"
    t.integer  "priority"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

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
    t.boolean  "is_admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wardrobes", force: :cascade do |t|
    t.integer  "clothing_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "chosen",      default: 0
    t.integer  "recommended", default: 0
  end

end
