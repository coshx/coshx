class AddAdminIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :admin_id, :integer
  end
end
