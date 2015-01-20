class ChangeTaglineToClientname < ActiveRecord::Migration
  def change
    rename_column :projects, :tagline, :client_name
  end
end
