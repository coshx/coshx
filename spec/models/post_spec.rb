require 'spec_helper'

describe Post do
  before :each do
    @markdown_doc = <<EOF
### Markdown header
#### Markdown subheader
This is some markdown text.
This is some more markdown text.
Yet another line of markdown text.
EOF
    @post = Post.create(:body => @markdown_doc)
  end

  it "renders the blog post body as html" do
    @post.body.should == @markdown_doc
    @post.body_html.should match /<h3>Markdown header<\/h3>/
    @post.body_html.should match /<h4>Markdown subheader<\/h4>/
    @post.body_html.should match /Yet another line of markdown text./
  end

  it "generates a preview from the blog post body" do
    @post.preview.should match /<h3>Markdown header<\/h3>/
    @post.preview.should match /This is some more markdown text./
    @post.preview.should_not match /Yet another line of markdown text./
  end

  it "adds ... to the end of the preview content" do
    @post.preview.should match /\.\.\.$/
  end
end
