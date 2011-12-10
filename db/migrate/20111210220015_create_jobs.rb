class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.datetime :posted_on

      t.timestamps
    end
  end
end
