class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.text :text
      t.string :company_name
      t.string :country
      t.string :phone
      t.text :project_description
      t.string :deadline
      t.string :budget
      t.text :comment

      t.timestamps
    end
  end
end
