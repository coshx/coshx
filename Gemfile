source "http://rubygems.org"

gem "rails", "~>3.1"

gem "pg"
gem "devise"
gem "redcarpet", "2.0.0.b5"
gem "pygmentize"
gem "nokogiri"
gem "factory_girl_rails"
gem "haml", ">= 3.0.0"
gem "haml-rails"
gem "jquery-rails"
gem "forgery"

# To use debugger
# gem "ruby-debug19", :require => "ruby-debug"

group :assets do
  gem "compass", :git => "git://github.com/chriseppstein/compass.git", :branch => "rails31"
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
end

group :development do
  gem "heroku_san"
end

gem "cucumber-rails", :group => [:development, :test]
gem "capybara", :group => [:development, :test]
gem "rspec-rails", ">= 2.0.1", :group => [:development, :test]