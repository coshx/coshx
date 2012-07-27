source "http://rubygems.org"

gem "rails", "3.2.6"

# database
gem "pg"


gem 'therubyracer'
gem 'execjs'
gem 'rb-readline'

# authenticate & authorization
gem "devise"

# presentation
gem "redcarpet"
gem "pygmentize"
gem "nokogiri"
gem "jquery-rails"
gem "haml-rails"
gem "gravatar-ultimate"
gem "kaminari"
gem "railties"

#Social media is cool?
gem "twitter"
# To use debugger
# gem "ruby-debug19", :require => "ruby-debug"

group :assets do
  gem "sass-rails",   '~> 3.2.3'
  gem "coffee-rails", '~> 3.2.1'
  gem "uglifier"
#  gem 'compass', '~> 0.12.alpha'
#	gem 'compass-rails', '~> 1.0.3'
	gem 'zurb-foundation', '~> 3.0.1'
  
end

group :development do
  gem "heroku_san"
end

group :test do
  gem "cucumber-rails", "~> 1.0", require: false
  gem "factory_girl_rails"
  gem "timecop"
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false # code coverage tool
end

group :development, :test do
  gem "database_cleaner"
  gem "forgery"
  gem "rspec-rails"
  gem "therubyracer", :require => 'v8'
  gem 'pry'
  gem 'pry-nav'
end
