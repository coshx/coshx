class AddSeoTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :seo_title, :string

    Post.reset_column_information
    Post.find(:all).each do |p|
    	p.seo_title = p.title
    	p.save
    end
    
  end
end
