Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY'] || 'uejU49OUdMLvhayPXBf3zg'
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN'] || '115769842-s7attzhMAjUXortJLjNVybEOxfmA2386lbbjPhkd'
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end