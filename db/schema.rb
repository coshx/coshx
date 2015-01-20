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

ActiveRecord::Schema.define(version: 20150120175356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",                                        null: false
    t.string   "encrypted_password",     default: "",                                        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "bio",                    default: "I'm a developer at Coshx and I love it!"
    t.string   "twitter"
    t.string   "github"
    t.string   "img"
    t.string   "quote"
    t.string   "likes"
    t.string   "dislikes"
    t.string   "slug"
    t.string   "nickname"
    t.datetime "deleted_at"
    t.string   "position"
    t.string   "last_name"
    t.string   "linked_in"
    t.boolean  "alumni",                 default: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "contents", force: :cascade do |t|
    t.string   "action"
    t.integer  "index"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.string   "paperclip_file_name"
    t.string   "paperclip_content_type"
    t.integer  "paperclip_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "admin_id"
  end

  add_index "images", ["admin_id"], name: "index_images_on_admin_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "posted_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "filled"
    t.string   "blog_url"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "text"
    t.string   "company_name"
    t.string   "country"
    t.string   "phone"
    t.text     "project_description"
    t.string   "deadline"
    t.string   "budget"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.integer  "author_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "posted_on"
    t.string   "permalink"
  end

  add_index "posts", ["permalink"], name: "index_posts_on_permalink", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.boolean  "featured"
    t.string   "url"
    t.text     "summary"
    t.string   "background_color"
    t.string   "permalink"
    t.string   "icon"
    t.boolean  "link_disabled"
    t.integer  "location_id"
    t.string   "client_name"
  end

  add_index "projects", ["permalink"], name: "index_projects_on_permalink", unique: true, using: :btree

  create_table "quotes", force: :cascade do |t|
    t.string   "text"
    t.string   "author"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
  end

  create_table "translations", force: :cascade do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
    t.text     "interpolations"
    t.boolean  "is_proc",        default: false
  end

end
