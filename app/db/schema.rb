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

ActiveRecord::Schema.define(:version => 20120210180658) do

  create_table "bios", :force => true do |t|
    t.integer  "host_id"
    t.date     "bios_release_date"
    t.string   "bios_vendor"
    t.string   "bios_version"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "bios", ["host_id", "bios_vendor"], :name => "index_bios_on_host_id_and_bios_vendor"

  create_table "bioses", :force => true do |t|
    t.integer  "host_id"
    t.date     "bios_release_date"
    t.string   "bios_vendor"
    t.string   "bios_version"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "hosts", :force => true do |t|
    t.string   "ipaddress",  :null => false
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hosts", ["ipaddress", "name"], :name => "index_hosts_on_ipaddress_and_name"

end
