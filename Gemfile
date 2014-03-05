source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'sqlite3'
gem "puma"
gem "redis"
gem 'omniauth'
gem 'omniauth-facebook', '1.4.0'
gem 'backbone-on-rails'
gem 'bcrypt-ruby', require: 'bcrypt'
gem 'formtastic'

gem 'aasm'

# FFI needed to regenerate public key from private key
gem 'ffi'
gem 'bitcoin-ruby', :git => "https://github.com/mhanne/bitcoin-ruby.git"

gem 'rabl'

# Keep for bootstrap
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sass-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'coffee-rails', '~> 4.0.0'
gem 'bootstrap-sass'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', :require => false
end

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-redis_helper'
  gem 'ir_b'
  gem 'steak'
  gem 'faker'
  gem 'machinist', :git => 'https://github.com/JamieFlournoy/machinist.git'
end

group :test do
  gem 'email_spec'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'launchy'
  gem 'capybara'
  gem 'factory_girl_rails', ">= 4.2.0"
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
