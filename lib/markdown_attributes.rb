module MarkdownAttributes
  def attr_markdown(*attributes)
    attributes.each do |attribute|
      define_method("#{attribute}_html") do
        markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :fenced_code_blocks => true)
        html = markdown_renderer.render(send attribute)
        Formatter.highlight_syntax(html)
      end
    end
  end

  class Formatter
    def self.highlight_syntax(html)
      doc = Nokogiri::HTML::fragment(html)
      doc.search("code").each do |code_tag|
        unless code_tag[:class].nil?
          code_tag.replace Pygmentize.process(code_tag.text.rstrip, code_tag[:class].intern)
        end
      end
      doc.to_s
    end
  end
end