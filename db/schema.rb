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

ActiveRecord::Schema.define(version: 20170122143506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
    t.index ["player_id"], name: "index_comments_on_player_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
    t.index ["player_id"], name: "index_goals_on_player_id", using: :btree
  end

  create_table "match_votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "best_goal_id"
    t.datetime "played_at"
    t.float    "point"
    t.index ["team1_id", "team2_id"], name: "index_matches_on_team1_id_and_team2_id", using: :btree
    t.index ["team1_id"], name: "index_matches_on_team1_id", using: :btree
    t.index ["team2_id"], name: "index_matches_on_team2_id", using: :btree
  end

  create_table "playbooks", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_playbooks_on_player_id", using: :btree
    t.index ["team_id"], name: "index_playbooks_on_team_id", using: :btree
  end

  create_table "player_votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "password_confirmation"
    t.json     "skill_points"
    t.boolean  "is_admin"
    t.integer  "comments_count"
    t.integer  "goals_count"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "is_active"
    t.index ["email"], name: "index_players_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "match_point"
    t.json     "player_points"
    t.integer  "match_id"
    t.integer  "player_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["match_id"], name: "index_votes_on_match_id", using: :btree
    t.index ["player_id"], name: "index_votes_on_player_id", using: :btree
  end

  add_foreign_key "comments", "players"
  add_foreign_key "goals", "players"
  add_foreign_key "matches", "goals", column: "best_goal_id"
  add_foreign_key "votes", "matches"
  add_foreign_key "votes", "players"
end
