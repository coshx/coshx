class ChangeProductDescriptionToDescription < ActiveRecord::Migration
  def change
    rename_column :projects, :product_description, :description
  end
end
