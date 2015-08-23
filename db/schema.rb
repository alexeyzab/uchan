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

ActiveRecord::Schema.define(version: 20150714215433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.string "category"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "post_title"
    t.text     "post_description"
    t.integer  "board_id"
    t.integer  "topic_id"
    t.string   "post_image_file_name"
    t.string   "post_image_content_type"
    t.integer  "post_image_file_size"
    t.datetime "post_image_updated_at"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "thread_name"
    t.text     "description"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "topic_image_file_name"
    t.string   "topic_image_content_type"
    t.integer  "topic_image_file_size"
    t.datetime "topic_image_updated_at"
  end

  add_foreign_key "topics", "boards"
end
