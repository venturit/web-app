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

ActiveRecord::Schema.define(:version => 20140113181642) do

  create_table "custom_fields", :force => true do |t|
    t.string   "value"
    t.string   "label"
    t.string   "options"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "data", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.float    "photosynthetic_efficiency_phi2"
    t.float    "fs"
    t.float    "temperature"
    t.float    "relative_humidity"
    t.float    "co2_content"
    t.float    "longitude"
    t.float    "latitude"
    t.text     "co2_raw"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "device_version"
    t.integer  "led_low"
    t.integer  "led_high"
    t.integer  "ir_low"
    t.integer  "ir_high"
    t.integer  "baseline"
    t.text     "data_raw"
    t.float    "fm"
    t.float    "co2_slope"
    t.integer  "co2_start"
    t.integer  "co2_end"
    t.integer  "co2_drop"
    t.integer  "light_intensity"
    t.integer  "red"
    t.integer  "blue"
    t.integer  "green"
  end

  create_table "project_collaborators", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "disclaimer"
    t.integer  "views"
    t.integer  "downloads"
    t.integer  "lead_id"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "start_date"
    t.datetime "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "is_open"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "directions_to_collaborators"
    t.boolean  "beta"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.text     "bio"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
