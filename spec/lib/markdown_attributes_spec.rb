require 'spec_helper'

describe MarkdownAttributes do
  before :each do
    class Tester; extend MarkdownAttributes; end
    @object = Tester.new
  end

  it "defines a method that formats a markdown attribute as html" do
    @object.class_eval do
      attr_accessor :title
      attr_markdown :title
    end
    @object.title = "#Markdown Header 1"
    @object.title.should == "#Markdown Header 1"
    @object.title_html.should include "<h1>Markdown Header 1</h1>"
  end

  it "accepts multiple attributes" do
    @object.class_eval do
      attr_accessor :title, :body
      attr_markdown :title, :body
    end
    @object.title = "#Markdown Header 1"
    @object.body = "Markdown body"

    @object.title_html.should include "<h1>Markdown Header 1</h1>"
    @object.body_html.should include "<p>Markdown body</p>"
  end

  it "highlights syntax" do
    @object.class_eval do
      attr_accessor :code_snippet
      attr_markdown :code_snippet
    end
    @object.code_snippet = "```ruby\n\n```"
    @object.code_snippet_html.should match /highlight/
  end
end