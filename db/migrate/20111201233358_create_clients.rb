class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :site_url
      t.text :quote
      t.string :quoted_person
      t.text :what_we_did
      t.string :company_logo

      t.timestamps
    end
  end
end
