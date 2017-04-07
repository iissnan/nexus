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

ActiveRecord::Schema.define(version: 20170407111101) do

  create_table "match_goals", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "score"
    t.string   "player1_sn"
    t.string   "player2_sn"
    t.datetime "at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_goals_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "home_team_id",    null: false
    t.integer  "away_team_id",    null: false
    t.integer  "home_team_score", null: false
    t.integer  "away_team_score", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "match_type"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "email"
    t.text     "display_name"
    t.text     "avatar"
    t.integer  "rating",       default: 2000
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.index ["player_id"], name: "index_players_teams_on_player_id"
    t.index ["team_id"], name: "index_players_teams_on_team_id"
  end

  create_table "serial_numbers", force: :cascade do |t|
    t.string   "number",     null: false
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_serial_numbers_on_player_id"
  end

  create_table "team_matches", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_team_matches_on_match_id"
    t.index ["team_id"], name: "index_team_matches_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",             default: ""
    t.integer  "player1_id",                    null: false
    t.integer  "player2_id"
    t.string   "player1_position"
    t.string   "player2_position"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["player1_id"], name: "index_teams_on_player1_id"
    t.index ["player2_id"], name: "index_teams_on_player2_id"
  end

  create_table "teamworks", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_teamworks_on_player_id"
    t.index ["team_id"], name: "index_teamworks_on_team_id"
  end

end
