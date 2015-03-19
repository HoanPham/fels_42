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

ActiveRecord::Schema.define(version: 20150319081148) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "lesson_words", id: false, force: :cascade do |t|
    t.integer "lesson_id",  limit: 4,                 null: false
    t.integer "word_id",    limit: 4,                 null: false
    t.integer "answer_id",  limit: 4, default: 0,     null: false
    t.boolean "is_correct", limit: 1, default: false, null: false
  end

  add_index "lesson_words", ["answer_id"], name: "idx_answer", using: :btree
  add_index "lesson_words", ["lesson_id"], name: "idx_lesson", using: :btree
  add_index "lesson_words", ["word_id"], name: "idx_word", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "user_id",     limit: 4, null: false
    t.integer  "category_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "lessons", ["category_id"], name: "idx_category", using: :btree
  add_index "lessons", ["user_id"], name: "idx_user", using: :btree

  create_table "options", force: :cascade do |t|
    t.string  "content",  limit: 255, null: false
    t.integer "word_id",  limit: 4,   null: false
    t.boolean "is_right", limit: 1,   null: false
  end

  add_index "options", ["word_id"], name: "idx_word", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4, null: false
    t.integer  "followed_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "idx_following", using: :btree
  add_index "relationships", ["follower_id"], name: "idx_follower", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "content",     limit: 255, null: false
    t.integer  "category_id", limit: 4,   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "words", ["category_id"], name: "idx_category", using: :btree

  add_foreign_key "lesson_words", "lessons", name: "lesson_words_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lesson_words", "options", column: "answer_id", name: "lesson_words_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lesson_words", "words", name: "lesson_words_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lessons", "categories", name: "lessons_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "options", "words", name: "options_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "words", "categories", name: "words_ibfk_1", on_update: :cascade, on_delete: :cascade
end
