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

ActiveRecord::Schema.define(:version => 20120315141422) do

  create_table "fights", :force => true do |t|
    t.integer  "started_by_id"
    t.integer  "opponent_id"
    t.string   "status",          :default => "i"
    t.boolean  "active",          :default => true
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "started_by_roll", :default => 0
    t.integer  "opponent_roll",   :default => 0
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.boolean  "is_boss",       :default => false
    t.boolean  "is_registered", :default => false
    t.boolean  "active",        :default => true
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "wins",          :default => 0
    t.integer  "losses",        :default => 0
    t.integer  "ties",          :default => 0
  end

  create_table "rounds", :force => true do |t|
    t.integer  "fight_id"
    t.integer  "started_by_roll"
    t.integer  "opponent_roll"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
