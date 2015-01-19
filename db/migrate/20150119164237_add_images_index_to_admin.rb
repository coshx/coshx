class AddImagesIndexToAdmin < ActiveRecord::Migration
  def change
    add_index :images, :admin_id
  end
end
