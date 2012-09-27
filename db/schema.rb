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

ActiveRecord::Schema.define(:version => 20120921151856) do

  create_table "cotizas", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "telefono"
    t.datetime "fecha"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "numero_personas"
    t.integer  "estado"
  end

  create_table "puntos", :force => true do |t|
    t.integer  "numero"
    t.string   "tipo"
    t.string   "calle"
    t.string   "interseccion"
    t.integer  "cotiza_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "comuna"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "ciudad"
    t.string   "pais"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

end
