class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "Admin"
  default_scope :order => "created_at DESC"

  def preview
    lines = self.body.split(/(\n)+/)
    preview_text = lines.reject do |line|
      line =~ /^$\n/
    end.take(4).join(' ')
    "#{preview_text.chomp}..."
  end

  def body_html
    if self.body
      Post.format_as_html(self.body)
    else
      nil
    end
  end

  def preview_html
    if self.preview
      Post.format_as_html(self.preview)
    else
      nil
    end
  end

  def publish
    unless self.published?
      self.posted_on = DateTime.now
    end
    self
  end

  def published?
    true unless self.posted_on.nil?
  end

  private
  def self.highlight_syntax(html)
    doc = Nokogiri::HTML::fragment(html)
    doc.search("code").each do |code_tag|
      unless code_tag[:class].nil?
        code_tag.replace Pygmentize.process(code_tag.text.rstrip, code_tag[:class].intern)
      end
    end
    doc.to_s
  end

  def self.format_as_html(text)
    markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :fenced_code_blocks => true)
    html = markdown_renderer.render(text)
    Post.highlight_syntax(html)
  end
end
