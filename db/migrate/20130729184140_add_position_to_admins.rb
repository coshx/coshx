class AddPositionToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :position, :string
  end
end
