class Post < ActiveRecord::Base
  extend MarkdownAttributes
  include Publishable

  belongs_to :author, :class_name => "Admin"
  default_scope :order => "created_at DESC"

  attr_markdown :preview, :body

  def preview
    lines = self.body.split(/(\n)+/)
    preview_text = lines.reject do |line|
      line =~ /^$\n/
    end.take(4).join(' ')
    "#{preview_text.chomp}..."
  end
end
