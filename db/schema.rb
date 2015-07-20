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

ActiveRecord::Schema.define(version: 20150720133358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name"
    t.text     "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "avatar"
    t.string   "facebook"
    t.string   "soundcloud"
    t.string   "twitter"
    t.text     "soundcloud_embed"
    t.boolean  "published",        default: false
    t.boolean  "family",           default: false
  end

  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "lead"
    t.text     "description"
    t.string   "facebook_page"
    t.string   "facebook_event"
    t.string   "call_to_action_url"
    t.string   "call_to_action_text"
    t.text     "manifesto"
    t.text     "livestream"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.string   "location"
    t.string   "cover"
    t.string   "trailer"
    t.boolean  "published",           default: false
    t.boolean  "cool_room",           default: false
    t.string   "thanks_header"
    t.text     "thanks_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret_hash"
    t.boolean  "completed",           default: false
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree

  create_table "mixes", force: true do |t|
    t.string   "mix_no"
    t.string   "title"
    t.text     "description"
    t.string   "avatar"
    t.integer  "artist_id"
    t.text     "soundcloud_embed"
    t.boolean  "published",        default: false
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret_hash"
  end

  add_index "mixes", ["slug"], name: "index_mixes_on_slug", unique: true, using: :btree

  create_table "performances", force: true do |t|
    t.integer  "artist_id"
    t.integer  "event_id"
    t.string   "audio_url"
    t.text     "audio_embed"
    t.string   "video_url"
    t.text     "video_embed"
    t.boolean  "featured"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "performances", ["artist_id"], name: "index_performances_on_artist_id", using: :btree
  add_index "performances", ["event_id"], name: "index_performances_on_event_id", using: :btree

  create_table "releases", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "release_no"
    t.string   "avatar"
    t.text     "soundcloud_embed"
    t.boolean  "published",        default: false
    t.string   "buy_link"
    t.string   "download_link"
    t.string   "secret_hash"
  end

  add_index "releases", ["artist_id"], name: "index_releases_on_artist_id", using: :btree
  add_index "releases", ["slug"], name: "index_releases_on_slug", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
