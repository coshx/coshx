require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, Post.new(
      :title => "MyTitle",
      :body => "MyBody"
    ))
  end

  it "renders new posts form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "input#post_seo_title[name=?]", "post[seo_title]"
      assert_select "textarea#post_body[name=?]", "post[body]"
    end
  end
end