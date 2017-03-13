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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170312165507) do

  create_table "matches", force: :cascade do |t|
    t.date     "date"
    t.integer  "match_id",    limit: 4
    t.string   "player_1",    limit: 255
    t.string   "player_2",    limit: 255
    t.integer  "player_1_id", limit: 4
    t.integer  "player_2_id", limit: 4
    t.string   "tournament",  limit: 255
    t.string   "round",       limit: 255
    t.string   "court",       limit: 255
    t.string   "time",        limit: 255
    t.string   "surface",     limit: 255
    t.string   "umpire",      limit: 255
    t.integer  "best_of",     limit: 4
    t.integer  "final_tb",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "overviews", force: :cascade do |t|
    t.date     "date"
    t.integer  "match_id",       limit: 4
    t.integer  "player",         limit: 4
    t.integer  "player_id",      limit: 4
    t.string   "set",            limit: 255
    t.integer  "serve_pts",      limit: 4
    t.integer  "aces",           limit: 4
    t.integer  "dfs",            limit: 4
    t.integer  "first_in",       limit: 4
    t.integer  "first_won",      limit: 4
    t.integer  "second_in",      limit: 4
    t.integer  "second_won",     limit: 4
    t.integer  "bk_pts",         limit: 4
    t.integer  "bp_saved",       limit: 4
    t.integer  "return_pts",     limit: 4
    t.integer  "return_pts_won", limit: 4
    t.integer  "winners",        limit: 4
    t.integer  "winners_fh",     limit: 4
    t.integer  "winners_bh",     limit: 4
    t.integer  "unforced",       limit: 4
    t.integer  "unforced_fh",    limit: 4
    t.integer  "unforced_bh",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "pid",        limit: 4
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "full_name",  limit: 255
    t.integer  "wrank",      limit: 4
    t.integer  "lrank",      limit: 4
    t.string   "hand",       limit: 255
    t.string   "dob",        limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: :cascade do |t|
    t.date     "date"
    t.integer  "player_1_id",        limit: 4
    t.integer  "player_2_id",        limit: 4
    t.integer  "pt",                 limit: 4
    t.integer  "set1",               limit: 4
    t.integer  "set2",               limit: 4
    t.integer  "gm1",                limit: 4
    t.integer  "gm2",                limit: 4
    t.string   "pts",                limit: 255
    t.integer  "gm",                 limit: 4
    t.integer  "tbset",              limit: 4
    t.integer  "tb",                 limit: 4
    t.integer  "tbpt",               limit: 4
    t.integer  "svr",                limit: 4
    t.string   "second_no_let",      limit: 255
    t.string   "second_sv",          limit: 255
    t.string   "first_sv",           limit: 255
    t.string   "first_no_sv",        limit: 255
    t.string   "second_no_sv",       limit: 255
    t.string   "is_rally_first",     limit: 255
    t.string   "is_rally_second",    limit: 255
    t.string   "sv_first",           limit: 255
    t.string   "sv_second",          limit: 255
    t.string   "rally",              limit: 255
    t.string   "is_ace",             limit: 255
    t.string   "is_Unret",           limit: 255
    t.string   "is_rally_winner",    limit: 255
    t.string   "is_forced",          limit: 255
    t.string   "is_unforced",        limit: 255
    t.string   "is_double",          limit: 255
    t.string   "rally_no_spec",      limit: 255
    t.string   "rally_no_error",     limit: 255
    t.string   "rally_no_direction", limit: 255
    t.string   "rally_len",          limit: 255
    t.string   "pt_winner",          limit: 255
    t.string   "is_svr_winner",      limit: 255
    t.string   "pts_after",          limit: 255
    t.integer  "gm_w",               limit: 4
    t.integer  "gm_1",               limit: 4
    t.integer  "gm_2",               limit: 4
    t.integer  "set_w",              limit: 4
    t.integer  "set1a",              limit: 4
    t.integer  "set2a",              limit: 4
    t.integer  "rev_tb",             limit: 4
    t.integer  "tb_rev",             limit: 4
    t.integer  "rally_count",        limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "ret",                limit: 4
    t.integer  "serving",            limit: 4
    t.string   "first",              limit: 255
    t.string   "second",             limit: 255
    t.text     "notes",              limit: 65535
    t.string   "first_no_let",       limit: 255
    t.string   "first_in",           limit: 255
    t.string   "second_in",          limit: 255
    t.integer  "player_1_id_id",     limit: 4
    t.integer  "player_2_id_id",     limit: 4
  end

  add_index "points", ["player_1_id_id"], name: "index_points_on_player_1_id_id", using: :btree
  add_index "points", ["player_2_id_id"], name: "index_points_on_player_2_id_id", using: :btree

  create_table "ranks", force: :cascade do |t|
    t.date     "ranking_date"
    t.integer  "ranking",        limit: 4
    t.integer  "pid",            limit: 4
    t.integer  "ranking_points", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               limit: 255,   default: "email", null: false
    t.string   "uid",                    limit: 255,   default: "",      null: false
    t.string   "encrypted_password",     limit: 255,   default: "",      null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "name",                   limit: 255
    t.string   "nickname",               limit: 255
    t.string   "image",                  limit: 255
    t.string   "email",                  limit: 255
    t.text     "tokens",                 limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
