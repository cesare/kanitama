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

ActiveRecord::Schema.define(:version => 20120211055312) do

  create_table "baseboards", :force => true do |t|
    t.integer  "host_id"
    t.string   "baseboard_product_name"
    t.string   "baseboard_serial_number"
    t.string   "baseboard_version"
    t.string   "baseboard_description"
    t.string   "system_uuid"
    t.string   "memory_maximum_capacity"
    t.integer  "memory_number_of_devices"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "bioses", :force => true do |t|
    t.integer  "host_id"
    t.date     "bios_release_date"
    t.string   "bios_vendor"
    t.string   "bios_version"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "hosts", :force => true do |t|
    t.string   "ipaddress",   :null => false
    t.string   "name",        :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "active_flag"
  end

  add_index "hosts", ["ipaddress", "name"], :name => "index_hosts_on_ipaddress_and_name"

  create_table "memories", :force => true do |t|
    t.integer  "baseboard_id"
    t.string   "memory_size"
    t.string   "memory_speed"
    t.string   "memory_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "processors", :force => true do |t|
    t.integer  "host_id"
    t.string   "processor_family"
    t.string   "processor_version"
    t.string   "processor_signature"
    t.string   "processor_manufacturer"
    t.string   "processor_max_speed"
    t.string   "processor_id"
    t.integer  "processor_core_count"
    t.integer  "processor_core_enabled"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end
