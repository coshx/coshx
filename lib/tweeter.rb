module Tweeter

  MAXIMUM_LENGTH = 140

  def self.blog_post_tweet(post)
    begin
      Twitter.update build_tweet(post)
    rescue => err
      Rails.logger.error "Unable to tweet blog post. Post and err below\n\n #{post.inspect} \n\n #{err.inspect}"
    end
  end

  def self.build_tweet(post)
    url = build_url(post)
    text = random_tweet post
    text = short_tweet post if tweet_length(text, url) > MAXIMUM_LENGTH
    text
  end

  def self.random_tweet(post, url)
    name  = post.author.name
    title = post.title
    [
      "Check out #{name}'s blog post on #{url} about \"#{title}\"",
      "#{name} wrote about \"#{title}\" on our blog. #{url}",
      "#{name} blogged about \"#{title}\". Check it out - #{url}"
    ].shuffle.first
  end

  def self.short_tweet(post, url)
    title = post.title

    text = "Check out our newest blog post at #{url} about \"#{title}\""
    text = "#{text[0...(MAXIMUM_LENGTH - 3)]}..." if tweet_length(text, url) > MAXIMUM_LENGTH
    text
  end

  private
  def self.build_url(post)
    options = post.permalink_attributes.merge(:host => ENV['COSHX_HOST'])
    Rails.application.routes.url_helpers.show_post_url(options)
  end

  def self.tweet_length(text, url)
    # Url's only count for 20 chars at most
    if url.length > 20
      text.length - url_length + 20
    else
      text.length
    end
  end
end
