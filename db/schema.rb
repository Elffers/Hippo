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

ActiveRecord::Schema.define(version: 201_402_272_130_01) do

  create_table "categories", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_products", force: true do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.string   "status",     default: "pending"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id" # buyer id
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     default: "pending"
  end

  create_table "products", force: true do |t|
    t.integer  "user_id" # seller id
    t.string   "name"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.boolean  "retired",     default: false
    t.integer  "inventory"
    t.string   "photo"
  end

  create_table "purchase_infos", force: true do |t|
    t.integer  "order_id" 
    t.integer  "user_id" # buyer id
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "billing_first"
    t.string   "billing_last"
    t.string   "credit_card_number"
    t.string   "expiration_date"
    t.string   "cvv"
    t.string   "billing_address"
    t.string   "billing_address2"
    t.string   "billing_city"
    t.string   "billing_state"
    t.integer  "billing_zip_code"
    t.boolean  "same_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "rating"
    t.integer  "product_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.string   "password_digest"
    t.string   "seller_address"
    t.string   "seller_address2"
    t.string   "seller_city"
    t.string   "seller_state"
    t.integer  "seller_zipcode"
  end

end
