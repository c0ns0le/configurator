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

ActiveRecord::Schema.define(version: 20140614073102) do

  create_table "config_set_values", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "status"
    t.string   "data_type"
    t.integer  "config_set_id"
    t.integer  "organization_id"
    t.datetime "deleted_at"
    t.datetime "expired_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag_name"
    t.datetime "published_at"
  end

  add_index "config_set_values", ["config_set_id"], name: "index_config_set_values_on_config_set_id"
  add_index "config_set_values", ["organization_id"], name: "index_config_set_values_on_organization_id"

  create_table "config_sets", force: true do |t|
    t.string   "name"
    t.string   "config_type"
    t.datetime "deleted_at"
    t.datetime "expired_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "modified_values", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "status"
    t.integer  "organization_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "modified_values", ["organization_id"], name: "index_modified_values_on_organization_id"
  add_index "modified_values", ["service_id"], name: "index_modified_values_on_service_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "office_type"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  add_index "organizations", ["parent_id"], name: "index_organizations_on_parent_id"

  create_table "service_default_values", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "status"
    t.string   "data_type"
    t.string   "deleted_at"
    t.string   "expired_at"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_default_values", ["service_id"], name: "index_service_default_values_on_service_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
