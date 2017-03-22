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

ActiveRecord::Schema.define(version: 20170322113236) do

  create_table "matches", force: :cascade do |t|
    t.integer  "home_team_id",    null: false
    t.integer  "away_team_id",    null: false
    t.integer  "home_team_score", null: false
    t.integer  "away_team_score", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "email",                          null: false
    t.text     "display_name"
    t.text     "avatar"
    t.integer  "rating",          default: 1000
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "password_digest", default: "",   null: false
  end

  create_table "players_matches", id: false, force: :cascade do |t|
    t.integer "players_id"
    t.integer "matches_id"
    t.index ["matches_id"], name: "index_players_matches_on_matches_id"
    t.index ["players_id"], name: "index_players_matches_on_players_id"
  end

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "players_id"
    t.integer "teams_id"
    t.index ["players_id"], name: "index_players_teams_on_players_id"
    t.index ["teams_id"], name: "index_players_teams_on_teams_id"
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

  create_table "teams_matches", id: false, force: :cascade do |t|
    t.integer "teams_id"
    t.integer "matches_id"
    t.index ["matches_id"], name: "index_teams_matches_on_matches_id"
    t.index ["teams_id"], name: "index_teams_matches_on_teams_id"
  end

end
