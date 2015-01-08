class RemoveFeaturedPictureFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :featured_picture
  end

  def down
    add_column :projects, :featured_picture, :string
  end
end
