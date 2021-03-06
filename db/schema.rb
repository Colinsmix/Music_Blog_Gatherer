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

ActiveRecord::Schema.define(version: 20140124041539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: true do |t|
    t.string   "name",                                   null: false
    t.string   "url",                                    null: false
    t.string   "status",          default: "unverified"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "submitter_id"
    t.text     "description",                            null: false
    t.integer  "favorites_count", default: 0
  end

  add_index "blogs", ["name"], name: "index_blogs_on_name", using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body",                              null: false
    t.string   "moderation", default: "unverified"
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "anonymous",  default: false
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "favorite_blogs", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "blog_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_blogs", ["blog_id"], name: "index_favorite_blogs_on_blog_id", using: :btree
  add_index "favorite_blogs", ["user_id"], name: "index_favorite_blogs_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "email",       null: false
    t.string   "subject",     null: false
    t.text     "description", null: false
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                   default: "member", null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
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

end
