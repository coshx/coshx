class UpdateProductsForNewSite < ActiveRecord::Migration
  def change
  	rename_column :projects, :description, :product_description
  	add_column :projects, :project_description, :text
  	add_column :projects, :result_description, :text

  	add_column :projects, :background_color, :string
  	add_column :projects, :featured_image, :string
  end
end
