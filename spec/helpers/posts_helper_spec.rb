require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PostsHelper do

  describe "#blog_post_path" do
    context "with published post" do
      let(:attributes) { {:key => 'value'} }
      let(:post) { mock_model Post, :published? => true, :permalink_attributes => attributes }

      it "should call show_post_path" do
        helper.should_receive(:show_post_path).with attributes
        helper.blog_post_path post
      end

      it "returns the value of show_post_path" do
        helper.stub(:show_post_path).and_return 'path'
        helper.blog_post_path(post).should == 'path'
      end
    end

    context "with an unpublished post" do
      let(:post) { mock_model Post, :published? => false }

      it "should call post_path" do
        helper.should_receive(:post_path).with post
        helper.blog_post_path post
      end

      it "returns the value of post_path" do
        helper.stub(:post_path).and_return 'path'
        helper.blog_post_path(post).should == 'path'
      end
    end
  end
end
