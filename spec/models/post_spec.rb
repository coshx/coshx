require 'spec_helper'

describe Post do
  it "renders markdown as html" do
    markdown_doc = <<EOF
### Markdown header
#### Markdown subheader
This is some markdown text.
EOF
    post = Post.create(:body => markdown_doc)
    post.body.should == markdown_doc
    post.body_html.should match /<h3>Markdown header<\/h3>/
    post.body_html.should match /<h4>Markdown subheader<\/h4>/
  end
end
