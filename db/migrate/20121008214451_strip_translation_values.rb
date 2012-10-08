class StripTranslationValues < ActiveRecord::Migration
  def up
    Contenteditable::Translation.all.each do |t|
      t.value = t.value.strip
      t.save
    end
  end

  def down
    # noop
  end
end
