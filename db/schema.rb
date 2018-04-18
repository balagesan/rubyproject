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

ActiveRecord::Schema.define(version: 20180417073132) do

  create_table "client_contacts", force: :cascade do |t|
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_mobile"
    t.integer  "client_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "client_posts", force: :cascade do |t|
    t.string   "title"
    t.string   "name"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "organization_name"
    t.string   "email"
    t.string   "business_phone"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "mobile"
    t.decimal  "available_credit_amount", precision: 5, scale: 2
    t.integer  "company"
    t.string   "country"
    t.integer  "currency"
    t.string   "street_first"
    t.string   "street_second"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
    t.string   "industry"
    t.string   "companysize"
    t.string   "fax"
    t.text     "internal_notes"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signups", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "confirmpwd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "confirmpwd"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

end
