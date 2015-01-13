class RenameIndexPictureProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :index_picture, :icon
  end
end
