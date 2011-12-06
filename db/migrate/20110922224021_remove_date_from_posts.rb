class RemoveDateFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :date
  end

  def down
    add_column :posts, :date, :datetime
  end
end
