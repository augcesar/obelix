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

ActiveRecord::Schema.define(:version => 20130522213448) do

  create_table "ramais", :force => true do |t|
    t.string   "callerid"
    t.string   "type"
    t.string   "username"
    t.string   "secret"
    t.string   "canreinvite"
    t.string   "host"
    t.string   "context"
    t.string   "dtmfmode"
    t.string   "call_limit"
    t.string   "nat"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sip", :force => true do |t|
    t.string   "context"
    t.integer  "bindport"
    t.string   "bindaddr"
    t.string   "tos_sip"
    t.string   "tos_audio"
    t.string   "tos_video"
    t.string   "videosupport"
    t.string   "t38pt_udptl"
    t.string   "limitonpeers"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
