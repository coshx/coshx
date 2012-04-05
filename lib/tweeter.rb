module Tweeter
  def self.blog_post_tweet(post)
    tweet = trim_tweet("Check out #{post.author.name}'s blog post on coshx.com/blog about \"#{post.title}\"")
    begin
      Twitter.update(tweet)
    rescue => err
      Rails.logger.error "Unable to tweet blog post. Post and err below\n\n #{post.inspect} \n\n #{err.inspect}"
    end
  end

  def self.trim_tweet(tweet)
    tweet = tweet[0..136] + "..." if tweet.length > 140
    tweet
  end
end