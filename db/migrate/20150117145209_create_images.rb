class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string   "paperclip_file_name"
      t.string   "paperclip_content_type"
      t.integer  "paperclip_file_size"
      t.datetime "avatar_updated_at"
      t.timestamps null: false
    end
  end
end