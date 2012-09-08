# This migration comes from contenteditable (originally 20120906212544)
class CreateContenteditableTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
