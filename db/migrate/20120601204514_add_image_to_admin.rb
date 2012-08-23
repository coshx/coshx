class AddImageToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :img, :string
  end
end
