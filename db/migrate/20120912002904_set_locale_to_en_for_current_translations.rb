class SetLocaleToEnForCurrentTranslations < ActiveRecord::Migration
  def up
    #Contenteditable::Translation.all.each do |t|
    #  t.locale = "en"
    #  t.save!
    #end
  end

  def down
    # noop
  end
end
