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

ActiveRecord::Schema.define(version: 20170411044722) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "serial_number_id"
    t.integer  "match_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["match_id"], name: "index_attendances_on_match_id"
    t.index ["serial_number_id"], name: "index_attendances_on_serial_number_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "serial_number_id"
    t.integer  "team_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["serial_number_id"], name: "index_contracts_on_serial_number_id"
    t.index ["team_id"], name: "index_contracts_on_team_id"
  end

  create_table "fights", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_fights_on_match_id"
    t.index ["team_id"], name: "index_fights_on_team_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.integer  "score"
    t.string   "sn1",        null: false
    t.string   "sn2"
    t.datetime "at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_goals_on_match_id"
    t.index ["team_id"], name: "index_goals_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "team1_id",   null: false
    t.integer  "team2_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team1_id"], name: "index_matches_on_team1_id"
    t.index ["team2_id"], name: "index_matches_on_team2_id"
  end

  create_table "serial_numbers", force: :cascade do |t|
    t.string   "number",     null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_serial_numbers_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",         default: ""
    t.string   "sn1",                       null: false
    t.string   "sn2"
    t.integer  "sn1_position"
    t.integer  "sn2_position"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["sn1"], name: "index_teams_on_sn1"
    t.index ["sn2"], name: "index_teams_on_sn2"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "email"
    t.text     "display_name"
    t.text     "avatar"
    t.integer  "rating",       default: 2000
    t.boolean  "sn_fixed",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
