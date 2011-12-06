class AddBioAndImageToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :bio, :text, :default => "I'm a developer at Coshx and I love it!"
    add_column :admins, :twitter, :string
    add_column :admins, :github,  :string
  end
end
