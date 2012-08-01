class AddPictureToFeaturedProjects < ActiveRecord::Migration
  def change
    add_column :featured_projects, :picture, :string
  end
end
