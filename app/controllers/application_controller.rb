class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :last_two_posts, :random_quote
  
  def last_two_posts
    @last_two_posts ||= Post.published.limit(2)
  end
  
  def random_quote
    Quote.first(:order => "RANDOM()")
  end
end
