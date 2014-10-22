require 'spec_helper'

describe "Blog" do

  context "a published blog post exists" do
    let!(:post) { FactoryGirl.create :published_post }

    describe "GET post_path" do
      it "links to the authors blog/index page using a URI-happy version of the author's name" do
        get show_post_path(post.permalink_attributes)

        response.body.should include "/blog/author/#{post.author.slug}"
      end
    end
    
    describe "GET /blog/author/[post.author_slug]" do
      before do
        get "/blog/author/#{post.author.slug}"
      end
      
      it "shows the blog post" do
        response.body.should include "/blog/author/#{post.author.slug}"
        response.body.should include post.title
        response.body.should include show_post_path(post.permalink_attributes)
      end
      
      it "displays author information" do
        response.body.should include Gravatar.new(post.author.email).image_url(:secure => true)
        response.body.should include "Posts by #{post.author.name}"
      end
    end
  end
end