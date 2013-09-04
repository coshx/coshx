class AddLastNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :last_name, :string
  end
end
