class AddBlogUrlToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :blog_url, :string
  end
end
