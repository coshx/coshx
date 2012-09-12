class AddColumnsToTranslations < ActiveRecord::Migration
  def self.up
    change_table :translations do |t|
      t.string :locale
      t.text   :interpolations
      t.boolean :is_proc, :default => false
    end
  end

  def self.down
    remove_column :translations, :locale
    remove_column :translations, :interpolations
    remove_column :translations, :is_proc
  end
end
