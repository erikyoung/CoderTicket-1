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

ActiveRecord::Schema.define(version: 20170702101348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "venue_id"
    t.string   "hero_image_url"
    t.text     "extended_html_description"
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "publish",                   default: false
    t.integer  "user_id"
    t.boolean  "is_published"
    t.boolean  "unpublish"
    t.index ["category_id"], name: "index_events_on_category_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
    t.index ["venue_id"], name: "index_events_on_venue_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_types", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "price"
    t.string   "name"
    t.integer  "max_quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["event_id"], name: "index_ticket_types_on_event_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.integer  "count"
    t.integer  "event_id"
    t.index ["event_id"], name: "index_tickets_on_event_id", using: :btree
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "full_address"
    t.integer  "region_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["region_id"], name: "index_venues_on_region_id", using: :btree
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events", "venues"
  add_foreign_key "ticket_types", "events"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "ticket_types"
  add_foreign_key "venues", "regions"
end
