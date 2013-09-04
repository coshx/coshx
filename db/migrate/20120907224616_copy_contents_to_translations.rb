class CopyContentsToTranslations < ActiveRecord::Migration
  def up
    # Content.all.each do |c|
    #   unless c.action.match(/\w+\/\w+\/\w+/) # unless old cruft
    #     Contenteditable::Translation.create(
    #                      :key => "#{c.action}", :value => c.value)
    #   end
    # end
  end

  def down
    # noop
  end
end
