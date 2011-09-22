class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "Admin"

  def body_html
    markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    if self.body
      markdown_renderer.render(self.body)
    else
      nil
    end
  end
end
