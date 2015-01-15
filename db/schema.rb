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

ActiveRecord::Schema.define(version: 20150107194129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",                                         null: false
    t.string   "encrypted_password",     limit: 255, default: "",                                         null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                                                              null: false
    t.datetime "updated_at",                                                                              null: false
    t.string   "name",                   limit: 255
    t.text     "bio",                                default: "I''m a developer at Coshx and I love it!"
    t.string   "twitter",                limit: 255
    t.string   "github",                 limit: 255
    t.string   "img",                    limit: 255
    t.string   "quote",                  limit: 255
    t.string   "likes",                  limit: 255
    t.string   "dislikes",               limit: 255
    t.string   "slug",                   limit: 255
    t.string   "nickname",               limit: 255
    t.datetime "deleted_at"
    t.string   "position",               limit: 255
    t.string   "last_name",              limit: 255
    t.string   "linked_in",              limit: 255
    t.boolean  "alumni",                             default: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "contents", force: :cascade do |t|
    t.string   "action",     limit: 255
    t.integer  "index"
    t.text     "value"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.text     "description",             null: false
    t.datetime "posted_on"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "filled"
    t.string   "blog_url",    limit: 255
  end

  create_table "messages", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.text     "text"
    t.string   "company_name",        limit: 255
    t.string   "country",             limit: 255
    t.string   "phone",               limit: 255
    t.text     "project_description"
    t.string   "deadline",            limit: 255
    t.string   "budget",              limit: 255
    t.text     "comment"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.text     "body",                   null: false
    t.integer  "author_id",              null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "posted_on"
    t.string   "permalink",  limit: 255
  end

  add_index "posts", ["permalink"], name: "index_posts_on_permalink", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.text     "product_description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "picture",             limit: 255
    t.boolean  "featured"
    t.string   "url",                 limit: 255
    t.text     "project_description"
    t.text     "result_description"
    t.string   "background_color",    limit: 255
    t.string   "tagline",             limit: 255
    t.string   "permalink",           limit: 255
    t.string   "icon",                limit: 255
    t.boolean  "link_disabled"
  end

  add_index "projects", ["permalink"], name: "index_projects_on_permalink", unique: true, using: :btree

  create_table "quotes", force: :cascade do |t|
    t.string   "text",       limit: 255
    t.string   "author",     limit: 255
    t.integer  "project_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "sort_order"
  end

  create_table "translations", force: :cascade do |t|
    t.string   "key",            limit: 255
    t.text     "value"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "locale",         limit: 255
    t.text     "interpolations"
    t.boolean  "is_proc",                    default: false
  end

end
