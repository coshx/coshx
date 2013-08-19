class RenameFeaturedImageProjects < ActiveRecord::Migration
  def change
  	rename_column :projects, :featured_image, :featured_picture
  end
end
