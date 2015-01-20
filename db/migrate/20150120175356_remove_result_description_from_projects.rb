class RemoveResultDescriptionFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :result_description
  end

  def down
    add_column :projects, :result_description, :string
  end
end
