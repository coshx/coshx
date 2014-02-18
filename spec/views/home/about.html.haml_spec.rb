require 'spec_helper'

describe "home/about" do
  context "twitter and github are present" do
    before do
      assign(:team, [
        stub_model(Admin,
          name:       "thisismyname",
          position:   "thisismyposition",
          twitter:    "thisismytwitter",
          github:     "thisismygithub"
        )
      ])
    end

    it "renders name, position, twitter, and github" do
      render
      expect(rendered).to include("thisismyname")
      expect(rendered).to include("thisismyposition")
      rendered.should match /<a href=\'http:\/\/twitter.com\/thisismytwitter\' target=\'_blank\'>Twitter<\/a>/
      rendered.should match /<a href=\'http:\/\/github.com\/thisismygithub\' target=\'_blank\'>Github<\/a>/
    end
  end
end
