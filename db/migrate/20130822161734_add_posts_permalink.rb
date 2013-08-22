class AddPostsPermalink < ActiveRecord::Migration

  def up
    change_table :posts do |t|
      t.string :permalink
      t.index :permalink, :unique => true
    end

    Post.reset_column_information
    Post.find_each do |post|
      if post.published?
        post.send :set_permalink
        post.save!
      end
    end
  end

  def down
    change_table :posts do |t|
      t.remove :permalink
    end
  end
end
