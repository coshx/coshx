class AddSeoTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :seo_title, :string
  end
end
