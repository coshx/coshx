class CreateFeaturedProjects < ActiveRecord::Migration
  def change
    create_table :featured_projects do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
