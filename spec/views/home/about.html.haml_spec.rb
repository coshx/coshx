require 'spec_helper'

describe "home/about" do
  context "linked_in, twitter and github are present" do
    before do
      assign(:team, [
        stub_model(Admin,
          name:       "thisismyname",
          position:   "thisismyposition",
          twitter:    "thisismytwitter",
          github:     "thisismygithub",
          linked_in:  "http://linkedin.com/thisismylinkedin"
        )
      ])
    end

    it "renders name, position, twitter, linkedin, and github" do
      render
      expect(rendered).to include("thisismyname")
      expect(rendered).to include("thisismyposition")
      rendered.should match /<a href=\'http:\/\/twitter.com\/thisismytwitter\' target=\'_blank\'>Twitter<\/a>/
      rendered.should match /<a href=\'http:\/\/github.com\/thisismygithub\' target=\'_blank\'>Github<\/a>/
      rendered.should match /<a href=\'http:\/\/linkedin.com\/thisismylinkedin\' target=\'_blank\'>LinkedIn<\/a>/
    end
  end

  context "linked_in, twitter and github are absent" do
    before do
      assign(:team, [
        stub_model(Admin,
          name:       "thisismyname",
          position:   "thisismyposition",
        )
      ])
    end

    it "renders name and position but none of twitter, linkedin, and github" do
      render
      expect(rendered).to include("thisismyname")
      expect(rendered).to include("thisismyposition")

      rendered.should_not match /Github/i
      rendered.should_not match /LinkedIn/i
      rendered.should_not match /Twitter/i
    end
  end
end
