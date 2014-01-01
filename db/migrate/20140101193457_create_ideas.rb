class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :author_id
      t.string :title
      t.text :description
      t.integer :up_votes, default: 0

      t.timestamps
    end
  end
end
