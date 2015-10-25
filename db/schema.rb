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

ActiveRecord::Schema.define(version: 20151024180738) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_logs", force: :cascade do |t|
    t.string   "original_filename"
    t.string   "name"
    t.string   "content_type"
    t.boolean  "processed",         default: false
    t.boolean  "boolean",           default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "address_id"
    t.integer  "provider_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.decimal  "unit_price",  precision: 10, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "orders", ["address_id"], name: "index_orders_on_address_id"
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["product_id"], name: "index_orders_on_product_id"
  add_index "orders", ["provider_id"], name: "index_orders_on_provider_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
