class AddAlumniToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :alumni, :boolean, :default => false
  end
end
