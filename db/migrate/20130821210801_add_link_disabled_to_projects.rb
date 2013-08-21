class AddLinkDisabledToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :link_disabled, :boolean
  end
end
