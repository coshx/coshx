require 'spec_helper'

describe Tweeter do
  let(:post) { mock_model(Post) }
  let(:permalink_attrs) { {:year => '2012', :month => '1', :day => '1',
                           :title => 'Title!'} }

  before do
    ENV['COSHX_HOST'] = 'example.com'
  end

  describe "blog post tweet" do
    it "sends twitter a tweet about the blog post" do
      Twitter.should_receive(:update)
      Tweeter.blog_post_tweet(build_stubbed :published_post)
    end
  end

  describe "build_tweet" do
    context "random_tweet is short enough" do
      before(:each) { described_class.stub(:random_tweet).and_return "hello" }

      it "returns the random tweet" do
        described_class.should_not_receive :short_tweet
        post.should_receive(:permalink_attributes).and_return(permalink_attrs)
        described_class.build_tweet(post).should == 'hello'
      end
    end

    context "random_tweet is too long" do
      before(:each) do
        described_class.stub(:random_tweet).and_return "Donec sed odio dui. Cras mattis consectetur purus sit amet fermentum. Donec id elit non mi porta gravida at eget metus. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis."
        described_class.stub(:short_tweet).and_return 'hello'
      end

      it "returns a short tweet" do
        post.should_receive(:permalink_attributes).and_return(permalink_attrs)
        described_class.build_tweet(post).should == 'hello'
      end
    end
  end

  describe "short tweet" do
    let(:title) { "Hey dog I heard you like twitter so I put some tweets in a tweeter module so you can tweet after you blog. Hey dog I heard you like twitter so I put some tweets in a tweeter module so you can tweet after you blog." }
    let(:post) { build_stubbed :post, title: title, posted_on: Date.parse("5/5/12")}

    it "trims tweets to 140 chars" do
      described_class.short_tweet(post).length.should == 140
    end
  end

  describe "random tweet should contain the" do
    let(:author) { 'Calvin' }
    let(:title)  { 'Why is Twitter always down?' }
    let(:url)    do
      Rails.application.routes.url_helpers.show_post_url(
                  post.permalink_attributes.merge(:host => ENV['COSHX_HOST']))
    end
    let(:post)   { build_stubbed :post, author: build_stubbed(:admin, :name => author), title: title, posted_on: Date.parse("5/5/12")}
    subject      { Tweeter.random_tweet post }

    it "author" do
      subject.should include author
    end

    it "title" do
      subject.should include title
    end

    it "url" do
      subject.should include url
    end
  end
end
