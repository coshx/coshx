class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :text
      t.string :author
      t.integer :project_id

      t.timestamps
    end
  end
end
