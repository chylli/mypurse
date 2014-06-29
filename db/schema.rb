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

ActiveRecord::Schema.define(version: 20140629061351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_categories", force: true do |t|
    t.integer  "user_id",                null: false
    t.string   "name",        limit: 32, null: false
    t.string   "description"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_categories", ["name"], name: "index_account_categories_on_name", unique: true, using: :btree
  add_index "account_categories", ["user_id"], name: "index_account_categories_on_user_id", using: :btree

  create_table "account_types", force: true do |t|
    t.integer  "user_id",                null: false
    t.string   "name",        limit: 32, null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_types", ["name"], name: "index_account_types_on_name", unique: true, using: :btree
  add_index "account_types", ["user_id"], name: "index_account_types_on_user_id", using: :btree

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "category_id"
    t.integer  "user_id"
    t.integer  "type_id"
    t.integer  "currency_id"
    t.decimal  "balance",     precision: 15, scale: 2, default: 0.0, null: false
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["name"], name: "index_accounts_on_name", unique: true, using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "currencies", force: true do |t|
    t.string   "name",       limit: 20
    t.string   "symbol",     limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",               null: false
  end

  add_index "currencies", ["user_id"], name: "index_currencies_on_user_id", using: :btree

  create_table "transaction_categories", force: true do |t|
    t.integer  "user_id",                null: false
    t.string   "name",        limit: 32, null: false
    t.string   "description"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "user_id",                                            null: false
    t.integer  "category_id",                                        null: false
    t.integer  "debit_id",                                           null: false
    t.integer  "credit_id",                                          null: false
    t.decimal  "amount",      precision: 15, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.text     "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",        limit: 2
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
