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

ActiveRecord::Schema.define(version: 20170503014540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidacies", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "performer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "performer_id"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "prace"
    t.text     "content"
    t.integer  "prefecture_id"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.date     "start"
    t.date     "end"
  end

  create_table "jenres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "past_events", force: :cascade do |t|
    t.string   "title"
    t.string   "prace"
    t.date     "date"
    t.text     "content"
    t.integer  "prefecture_id"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "performers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "prefecture_id"
    t.integer  "jenre_id"
    t.integer  "support"
    t.string   "movie"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
    t.string   "message"
  end

  add_index "performers", ["email"], name: "index_performers_on_email", unique: true, using: :btree
  add_index "performers", ["reset_password_token"], name: "index_performers_on_reset_password_token", unique: true, using: :btree

  create_table "prefectures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replies", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "performer_id"
    t.integer  "request_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "requests", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "performer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
