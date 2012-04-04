module Tweeter
  def self.blog_post_tweet(post)
    tweet = trim_tweet("Check out #{post.author.name}'s blog post on coshx.com/blog about \"#{post.title}\"")
    Twitter.update(tweet)
  end

  def self.trim_tweet(tweet)
    tweet = tweet[0..140] + "..." if tweet.length > 144
    tweet
  end
end