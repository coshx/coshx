class AddPermalinkToProjects < ActiveRecord::Migration

  def up
    change_table :projects do |t|
      t.string :permalink
      t.index :permalink, :unique => true
    end

    Project.reset_column_information
    Project.find_each do |project|
      project.send :set_permalink
      project.save!
    end
  end

  def down
    change_table :projects do |t|
      t.remove :permalink
    end
  end
end