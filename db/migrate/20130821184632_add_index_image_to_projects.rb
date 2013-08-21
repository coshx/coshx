class AddIndexImageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :index_picture, :string
  end
end
