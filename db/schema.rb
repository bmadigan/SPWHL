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

ActiveRecord::Schema.define(:version => 20110921144114) do

  create_table "arenas", :force => true do |t|
    t.string   "arena_name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "arena_id"
  end

  create_table "articles", :force => true do |t|
    t.string   "article_title"
    t.text     "article_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "summary"
    t.string   "article_image",   :default => "default.png"
  end

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.integer  "page_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.integer  "season_id"
    t.boolean  "is_house_league"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "director_id"
    t.text     "page_content"
    t.string   "short_name"
    t.integer  "display_order",   :default => 0
  end

  create_table "mediafiles", :force => true do |t|
    t.string   "name"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
  end

  create_table "page_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "page_title"
    t.string   "page_description"
    t.text     "page_content"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rosters", :force => true do |t|
    t.integer  "team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.string   "jersey_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.integer  "league_id"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.boolean  "is_game"
    t.boolean  "is_draft_game"
    t.datetime "scheduled_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arena"
    t.boolean  "is_change"
    t.integer  "home_team_score"
    t.integer  "away_team_score"
    t.boolean  "set_standings",   :default => false
    t.string   "custom_text"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_schedules", :force => true do |t|
    t.integer  "team_id"
    t.datetime "event_date"
    t.string   "event_title"
    t.text     "event_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "league_id"
    t.integer  "manager_id"
    t.text     "team_page_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goals_for",         :default => 0
    t.integer  "goals_against",     :default => 0
    t.integer  "wins",              :default => 0
    t.integer  "loses",             :default => 0
    t.integer  "ties",              :default => 0
    t.boolean  "is_official",       :default => true
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.integer  "season_id"
    t.integer  "page_content"
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
