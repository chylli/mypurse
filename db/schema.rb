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

ActiveRecord::Schema.define(version: 20140820103756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "category_id"
    t.integer  "user_id"
    t.integer  "currency_id"
    t.decimal  "balance",                 precision: 15, scale: 2, default: 0.0, null: false
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",         limit: 64
    t.decimal  "init_balance",                                     default: 0.0
  end

  add_index "accounts", ["type"], name: "index_accounts_on_type", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.integer  "user_id",                         null: false
    t.string   "name",                 limit: 32, null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_account_type"
    t.string   "ancestry"
    t.string   "type",                 limit: 64
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  add_index "categories", ["type"], name: "index_categories_on_type", using: :btree
  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "currencies", force: true do |t|
    t.string   "name",          limit: 20
    t.string   "symbol",        limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                                                         null: false
    t.string   "type",          limit: 32,                                        null: false
    t.decimal  "exchange_rate",            precision: 15, scale: 4, default: 1.0, null: false
  end

  add_index "currencies", ["user_id"], name: "index_currencies_on_user_id", using: :btree

  create_table "transactions", force: true do |t|
    t.integer  "user_id",                                              null: false
    t.integer  "debit_id",                                             null: false
    t.integer  "credit_id",                                            null: false
    t.decimal  "credit_amount", precision: 15, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time"
    t.decimal  "debit_amount",  precision: 15, scale: 2, default: 0.0, null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.text     "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",        limit: 2
    t.integer  "currency_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
