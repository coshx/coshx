class AddLocationIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :location_id, :integer
  end
end
