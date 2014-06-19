require 'spec_helper'

describe "home/about" do
  context "linked_in, twitter, github, and a blog post are present" do
    before do
      @post = FactoryGirl.build :post
      @admin = FactoryGirl.create(:admin, posts: [@post], position: "engineering guru",
                                 twitter: "mytwitter", github: "mygithub", linked_in: "mylinkedin", alumni:false)
      @team = [@admin]
      @alumni = []
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

    it "does not render alumni" do
      render
      rendered.should_not have_selector("div#alumni-row")
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
      @alumni = []
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

  context "a user is an alumni" do
    before do
      @post = FactoryGirl.build :post
      @admin = FactoryGirl.create(:admin, posts: [@post], position: "engineering guru",
                                 twitter: "mytwitter", github: "mygithub", linked_in: "mylinkedin", alumni:true, name:"thisismyname")
      @member = FactoryGirl.create(:admin, position: "Code Robot", name:"Bender", alumni:false)
      
      @team = [@member]
      @alumni = [@admin]
    end

    it "renders them under alumni" do
      render
      expect(rendered).to have_selector("div#alumni-row")
    end

    it "includes team member under team" do
      render
      expect(rendered).to have_selector("div#team-row")
    end

    it "renders alumni name and position but not modal" do
      render
      expect(rendered).to include("thisismyname")
      expect(rendered).to include("engineering guru")

      rendered.should_not match /Github/i
      rendered.should_not match /LinkedIn/i
      rendered.should_not match /Twitter/i
      rendered.should_not match /\/posts/i
    end
  end
end
