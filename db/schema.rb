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

ActiveRecord::Schema.define(version: 20180715071225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "projects", force: :cascade do |t|
    t.uuid     "uuid",         default: -> { "uuid_generate_v4()" }
    t.string   "name"
    t.text     "description"
    t.boolean  "completed",    default: false
    t.datetime "completed_on"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.uuid     "uuid",         default: -> { "uuid_generate_v4()" }
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.boolean  "completed",    default: false
    t.datetime "completed_on"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.uuid     "uuid",                default: -> { "uuid_generate_v4()" }
    t.string   "name"
    t.string   "email",               default: "",                          null: false
    t.string   "password_hash"
    t.string   "password_salt"
    t.bigint   "phone_number"
    t.datetime "remember_created_at"
    t.boolean  "admin",               default: false
    t.integer  "sign_in_count",       default: 0,                           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
  end

end
