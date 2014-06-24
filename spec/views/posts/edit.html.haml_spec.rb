require 'spec_helper'

describe "posts/edit" do
  
  let(:admin){ FactoryGirl.create(:admin) }

  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "MyTitle",
      :body => "MyBody",
      :author => admin,
      :seo_title => "MyTitle"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "input#post_seo_title[name=?]", "post[seo_title]"
      assert_select "textarea#post_body[name=?]", "post[body]"
    end
  end
end
