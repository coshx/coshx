class AddFieldsToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins, :quote, :string
  	add_column :admins, :likes, :string
  	add_column :admins, :dislikes, :string
  end
end
