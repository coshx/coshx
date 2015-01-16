source "http://rubygems.org"
ruby "2.2.0"

gem "rails", "~> 4.2.0"

gem "activeresource"
gem 'protected_attributes'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'

#moving nokogiri up here because of dependency issues
gem "nokogiri"

gem "seed_dump"

# web server
gem 'thin'

# database
gem "pg"
gem "paranoia"

# authentication
gem 'devise'

# presentation
gem "redcarpet"
gem "pygmentize"
gem 'jquery-rails'
gem "haml-rails"
gem "gravatar-ultimate"
gem "kaminari"
gem 'jquery-ui-rails'

# pictures
gem 'carrierwave'
gem 'rmagick'
gem 'fog'

#Social media is cool?
gem "twitter"
gem "twitter-text"

# Permalinks
gem 'has_permalink'

# Turbolinks!
gem "turbolinks"

gem 'mobu'

# https://github.com/kjvarga/sitemap_generator
gem 'sitemap_generator'

gem 'i18n-active_record', git:'git://github.com/svenfuchs/i18n-active_record.git', require: 'i18n/active_record'

gem 'bourbon'

group :production do
  gem 'rails_12factor'
end

group :assets do
  # upload assets to s3 before deploying to heroku
  gem "asset_sync"

  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
  gem 'execjs'
end

group :development do
  gem "heroku_san"
  gem 'better_errors'
  gem 'meta_request'
end

group :development, :test do
  gem 'rspec-activemodel-mocks'
  gem "cucumber-rails", :require => false
  gem "factory_girl_rails"
  gem "timecop"
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
  gem "database_cleaner"
  gem "forgery"
  gem "rspec-rails"
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'poltergeist'
end

