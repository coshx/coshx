module Tweeter
  def self.blog_post_tweet(post)
    tweet = trim_tweet(random_tweet(post.author.name, post.title))
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

  def self.random_tweet(name, title)
    tweets = ["Check out #{name}'s blog post on coshx.com/blog about \"#{title}\""]
    tweets << "#{name} wrote about \"#{title}\" on our blog. Coshx.com/blog"
    tweets << "#{name} blogged about \"#{title}\". Check it out- coshx.com/blog"
    tweets[rand(tweets.length)]
  end
end