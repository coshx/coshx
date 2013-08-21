source "http://rubygems.org"

ruby "1.9.3"

gem "rails", "~> 3.2.9"

#moving nokogiri up here because of dependency issues
gem "nokogiri"


# web server
gem 'thin'

# database
gem "pg"
gem "paranoia"

# authentication
gem "devise", '2.1.2'

# presentation
gem "redcarpet"
gem "pygmentize"
gem 'jquery-rails', '~> 2.3.0'
gem "haml-rails"
gem "gravatar-ultimate"
gem "kaminari"

# pictures
gem 'carrierwave'
gem 'rmagick', '~> 2.13.2'
gem 'fog'

#Social media is cool?
gem "twitter"

# Permalinks
gem 'has_permalink'

# Turbolinks!
gem "turbolinks"

gem 'i18n-active_record',
    :git => 'git://github.com/svenfuchs/i18n-active_record.git',
    :branch => 'rails-3.2',
    :require => 'i18n/active_record'

# lightweight I18n frontend
gem 'contenteditable', :github => 'micmmakarov/contenteditable', :branch => 'master'

# sass mixin library
gem 'bourbon'

# best practices
gem 'rails_best_practices'

group :assets do
  # upload assets to s3 before deploying to heroku
  gem "asset_sync"

  gem "sass-rails",   '~> 3.2.3'
  gem "coffee-rails", '~> 3.2.1'
  gem "uglifier"
  gem 'compass-rails', '~> 1.0.3'
  gem 'zurb-foundation', '~> 3.0.1'
  gem 'execjs'
end

group :development do
  gem "heroku_san", '~> 4.2.2'
  gem "pry"
  gem "pry-nav"
  gem 'better_errors'
end

group :development, :test do
  gem "cucumber-rails", :require => false
  gem "factory_girl_rails"
  gem "timecop"
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false # code coverage tool
  gem "database_cleaner"
  gem "forgery"
  gem "rspec-rails"
  gem 'pry'
  gem 'pry-nav'
  gem 'faker'
end
