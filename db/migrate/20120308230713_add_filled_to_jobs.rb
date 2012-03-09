class AddFilledToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :filled, :boolean
  end
end
