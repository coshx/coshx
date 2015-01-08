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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150107194129) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "",                                           :null => false
    t.string   "encrypted_password",     :default => "",                                           :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                                       :null => false
    t.datetime "updated_at",                                                                       :null => false
    t.string   "name"
    t.text     "bio",                    :default => "I''''m a developer at Coshx and I love it!"
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
    t.boolean  "alumni",                 :default => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "contents", :force => true do |t|
    t.string   "action"
    t.integer  "index"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description", :null => false
    t.datetime "posted_on"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "filled"
    t.string   "blog_url"
  end

  create_table "messages", :force => true do |t|
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
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "body",       :null => false
    t.integer  "author_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "posted_on"
    t.string   "permalink"
  end

  add_index "posts", ["permalink"], :name => "index_posts_on_permalink", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "product_description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "picture"
    t.boolean  "featured"
    t.string   "url"
    t.text     "project_description"
    t.text     "result_description"
    t.string   "background_color"
    t.string   "tagline"
    t.string   "permalink"
    t.string   "icon"
    t.boolean  "link_disabled"
  end

  add_index "projects", ["permalink"], :name => "index_projects_on_permalink", :unique => true

  create_table "quotes", :force => true do |t|
    t.string   "text"
    t.string   "author"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "sort_order"
  end

  create_table "translations", :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "locale"
    t.text     "interpolations"
    t.boolean  "is_proc",        :default => false
  end

end
