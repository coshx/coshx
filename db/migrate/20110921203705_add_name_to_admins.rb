class AddNameToAdmins < ActiveRecord::Migration
  def up
    add_column :admins, :name, :string
  end

  def down
    remove_column :admins, :name
  end
end
