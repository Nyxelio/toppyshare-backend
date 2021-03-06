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

ActiveRecord::Schema.define(version: 20150519225515) do

  create_table "followings", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "following_user_id"
  end

  add_index "followings", ["following_user_id", "user_id"], name: "index_followings_on_following_user_id_and_user_id", unique: true
  add_index "followings", ["user_id", "following_user_id"], name: "index_followings_on_user_id_and_following_user_id", unique: true

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.integer  "top_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["top_id"], name: "index_items_on_top_id"

  create_table "tops", force: :cascade do |t|
    t.string   "title"
    t.text     "tags"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "forked_top_id"
  end

  add_index "tops", ["user_id"], name: "index_tops_on_user_id"

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
    t.string   "name"
    t.string   "lang"
    t.string   "country"
    t.text     "categories"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
