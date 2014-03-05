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

ActiveRecord::Schema.define(version: 20140217104433) do

  create_table "address_externals", force: true do |t|
    t.string   "address",                     null: false
    t.boolean  "forwardable", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bitcoin_addresses", force: true do |t|
    t.string   "id_alias",    null: false
    t.string   "address",     null: false
    t.string   "private_key", null: false
    t.string   "public_key",  null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "connection_id"
  end

  create_table "payments", force: true do |t|
    t.integer  "bitcoin_address_id",                          null: false
    t.integer  "transaction_id",                              null: false
    t.decimal  "amount",             precision: 16, scale: 8, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.string   "name",       null: false
    t.string   "state",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.binary   "binary",          null: false
    t.string   "bitcoin_tx_hash", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment"
  end

  create_table "users", force: true do |t|
    t.string   "name",          null: false
    t.string   "email",         null: false
    t.string   "password_hash", null: false
    t.string   "password_salt", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
