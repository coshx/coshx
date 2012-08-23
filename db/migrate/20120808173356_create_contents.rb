class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :action
      t.integer :index
      t.text :value

      t.timestamps
    end
  end
end
