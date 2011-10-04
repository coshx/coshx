class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "Admin"

  def body_html
    markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :fenced_code_blocks => true)
    if self.body
      html = markdown_renderer.render(self.body)
      highlight_syntax(html)
    else
      nil
    end
  end

  def preview
    lines = body_html.split(/(\n)+/)
    preview = lines.reject do |line|
      line =~ /^$\n/
    end.take(4).join(' ')
    add_ellipses preview
  end
  
  private
  def highlight_syntax(html)
    doc = Nokogiri::HTML::fragment(html)
    doc.search("code").each do |code_tag|
      unless code_tag[:class].nil?
        code_tag.replace Pygmentize.process(code_tag.text.rstrip, code_tag[:class].intern)
      end
    end
    doc.to_s
  end

  def add_ellipses(html)
    doc = Nokogiri::HTML::fragment(html)
    debug = doc.search("*")
    last_node = debug.last
    last_node.content = "#{last_node.content}..."
    doc.to_s
  end
end
