require 'spec_helper'

describe Post do
  context "post body" do
    before :each do
      @post = Factory.create :post
    end
    it "renders as html" do
      @post.body_html.should match /<h3>Markdown header<\/h3>/
      @post.body_html.should match /<h4>Markdown subheader<\/h4>/
      @post.body_html.should match /Yet another line of markdown text./
    end

    it "generates a shortened preview" do
      @post.preview.should match /<h3>Markdown header<\/h3>/
      @post.preview.should match /This is some more markdown text./
      @post.preview.should_not match /Yet another line of markdown text./
    end

    it "adds ... to the end of the preview content" do
      @post.preview.should match /\.\.\.<\/p>$/
    end
  end

  context "querying posts" do
    before :each do
      ["2008-01-01", "2009-01-01", "2010-01-01"].each do |date|
        Factory.create :post, :posted_on => DateTime.parse(date)
      end
    end
    
    it "returns posts in reverse-chronological order" do
      posts = Post.all
      posts[0].posted_on.year.should == 2010
      posts[1].posted_on.year.should == 2009
      posts[2].posted_on.year.should == 2008
    end
  end

  context "recent" do
    it "lists the most recent post first" do
      @post2 = Post.create(:body => "most recent")
      Post.recent.first.should == @post2
    end
  end
end
