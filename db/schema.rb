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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 4) do

  create_table "people", :force => true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "address"
    t.string  "city"
    t.string  "postal_code"
    t.string  "phone_number"
    t.string  "province"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "activation_token"
    t.datetime "activation_expires_after"
  end

  create_table "vehicles", :force => true do |t|
    t.string  "license_plate"
    t.string  "colour"
    t.string  "make"
    t.string  "model"
    t.string  "year"
    t.integer "user_id"
  end

end