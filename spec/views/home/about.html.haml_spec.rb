require 'spec_helper'

describe "home/about" do
  context "linked_in, twitter, github, and a blog post are present" do
    before do
      @post = FactoryGirl.build :post
      @admin = FactoryGirl.create(:admin, posts: [@post], position: "engineering guru",
                                 twitter: "mytwitter", github: "mygithub", linked_in: "mylinkedin", alumni:false)
      @team = [@admin]
    end

    it "renders name, position, twitter, linkedin, github, and link to blog" do
      render
      expect(rendered).to include(@admin.name)
      expect(rendered).to include(@admin.position)
      rendered.should match /<a href=\'http:\/\/twitter.com\/#{@admin.twitter}\' target=\'_blank\'>Twitter<\/a>/
      rendered.should match /<a href=\'http:\/\/github.com\/#{@admin.github}\' target=\'_blank\'>Github<\/a>/
      rendered.should match /<a href=\'#{@admin.linked_in}\' target=\'_blank\'>LinkedIn<\/a>/
      rendered.should match /Blog posts/
    end
  end

  context "linked_in, twitter, github, and blog posts are absent" do
    before do
      assign(:team, [
        stub_model(Admin,
          name:       "thisismyname",
          position:   "thisismyposition",
        )
      ])
    end

    it "renders name and position but none of twitter, linkedin, github, or blog posts" do
      render
      expect(rendered).to include("thisismyname")
      expect(rendered).to include("thisismyposition")

      rendered.should_not match /Github/i
      rendered.should_not match /LinkedIn/i
      rendered.should_not match /Twitter/i
      rendered.should_not match /\/posts/i
    end
  end
end
