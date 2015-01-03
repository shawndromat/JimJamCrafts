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

ActiveRecord::Schema.define(version: 20150103212244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "download_codes", force: true do |t|
    t.string   "code",         null: false
    t.integer  "pattern_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_number", null: false
  end

  add_index "download_codes", ["code"], name: "index_download_codes_on_code", unique: true, using: :btree
  add_index "download_codes", ["order_number"], name: "index_download_codes_on_order_number", using: :btree

  create_table "pattern_files", force: true do |t|
    t.string   "name",           null: false
    t.integer  "pattern_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filepicker_url"
    t.string   "filename"
  end

  create_table "patterns", force: true do |t|
    t.string   "name",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_id", limit: 8,              null: false
    t.string   "image_url",            default: "", null: false
  end

  add_index "patterns", ["name"], name: "index_patterns_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
