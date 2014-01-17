class StripTranslationValues < ActiveRecord::Migration
  def up
    #Contenteditable seems to have been removed so not sure if this migration is needed anymore, but leaving it for people who do have this - but with a rescue
    begin
      Contenteditable::Translation.all.each do |t|
       t.value = t.value.strip
       t.save
      end
    rescue => err
      puts "Error in StripTranslationValues: #{err.to_s}"
    end
  end

  def down
    # noop
  end
end
