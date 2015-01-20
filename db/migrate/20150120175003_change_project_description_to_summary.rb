class ChangeProjectDescriptionToSummary < ActiveRecord::Migration
  def change
    rename_column :projects, :project_description, :summary
  end
end
