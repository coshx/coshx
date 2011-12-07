class AddPostDateToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :posted_on, :datetime
  end

  def down
    remove_column :posts, :posted_on
  end
end
