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

ActiveRecord::Schema.define(version: 20141128065118) do

  create_table "expiration_dates", force: true do |t|
    t.string   "name"
    t.integer  "fridge_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "freezer_duration"
    t.string   "comments"
    t.integer  "food_type_id"
  end

  add_index "expiration_dates", ["food_type_id"], name: "index_expiration_dates_on_food_type_id"

  create_table "food_types", force: true do |t|
    t.string "name"
  end

  add_index "food_types", ["name"], name: "index_food_types_on_name"

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "expiration_date_id"
    t.integer  "user_id"
    t.datetime "purchase_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["created_at"], name: "index_ingredients_on_created_at"
  add_index "ingredients", ["expiration_date_id"], name: "index_ingredients_on_expiration_date_id"
  add_index "ingredients", ["user_id"], name: "index_ingredients_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "timezone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
