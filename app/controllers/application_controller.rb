class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :last_two_posts
  def last_two_posts
    @last_two_posts ||= Post.published.limit(2)
  end

  helper_method :last_tweet
  def last_tweet
    Twitter.user_timeline("coshxlabs", :count => 1)[0].text
  end
end
