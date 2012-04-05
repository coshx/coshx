require 'spec_helper'

describe Tweeter do
  describe "blog post tweet" do
    it "sends twitter a tweet about the blog post" do
      Twitter.should_receive(:update)
      Tweeter.blog_post_tweet(build :published_post)
    end
  end
  describe "trim tweet" do
    it "trims tweets to 140 chars" do
      tweet =  Tweeter.trim_tweet("Hey dog I heard you like twitter so I put some tweets in a tweeter module so you can tweet after you blog. Hey dog I heard you like twitter so I put some tweets in a tweeter module so you can tweet after you blog.")
      tweet.length.should == 140
    end
  end
end