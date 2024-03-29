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

ActiveRecord::Schema.define(version: 20150618114853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.date     "birthdate"
    t.date     "death_date"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "artists_galleries", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artists_galleries", ["artist_id"], name: "index_artists_galleries_on_artist_id", using: :btree
  add_index "artists_galleries", ["gallery_id"], name: "index_artists_galleries_on_gallery_id", using: :btree

  create_table "artworks", force: :cascade do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.string   "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "date"
    t.string   "picture_url"
  end

  add_index "artworks", ["artist_id"], name: "index_artworks_on_artist_id", using: :btree

  create_table "artworks_groupshows", id: false, force: :cascade do |t|
    t.integer "artwork_id",   null: false
    t.integer "groupshow_id", null: false
  end

  add_index "artworks_groupshows", ["artwork_id", "groupshow_id"], name: "index_artworks_groupshows_on_artwork_id_and_groupshow_id", using: :btree

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dialog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dialogs", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "text"
    t.date     "date"
    t.string   "img_url"
    t.string   "tweet_id"
    t.string   "origin_profilpic_url"
    t.string   "origin_user"
    t.string   "origin_screen_name"
    t.string   "origin_text"
    t.string   "origin_date"
    t.integer  "artwork_id"
  end

  add_index "dialogs", ["artwork_id"], name: "index_dialogs_on_artwork_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groupshows", force: :cascade do |t|
    t.string   "name"
    t.integer  "gallery_id"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "groupshows", ["gallery_id"], name: "index_groupshows_on_gallery_id", using: :btree
  add_index "groupshows", ["institution_id"], name: "index_groupshows_on_institution_id", using: :btree

  create_table "insta", force: :cascade do |t|
    t.string   "ig_username"
    t.string   "ig_fullname"
    t.string   "ig_text"
    t.date     "date"
    t.string   "ig_img_url"
    t.string   "ig_user_profilpic_url"
    t.string   "ig_location"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "name"
    t.string   "email"
    t.string   "token"
    t.string   "secret"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "artists_galleries", "artists"
  add_foreign_key "artists_galleries", "galleries"
  add_foreign_key "artworks", "artists"
  add_foreign_key "dialogs", "artworks"
  add_foreign_key "groupshows", "galleries"
  add_foreign_key "groupshows", "institutions"
end
