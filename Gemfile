source 'https://rubygems.org'

ruby '2.1.5'

# core
gem 'rails', '~> 4.1.8'
gem 'figaro', '~> 1.0.0'
gem 'pg'
gem 'coveralls', require: false

# assets
gem 'coffee-rails', '~> 4.1.0'
gem 'sass-rails', '~> 4.0.4'
gem 'uglifier', '>= 1.3.0'
gem 'neat', '~> 1.5.0'
gem 'normalize-rails', '~> 3.0'

# authentication
gem 'devise', '~> 3.4.1'
gem 'doorkeeper', '~> 2.1.0'

# background-processing
gem 'sidekiq', '~> 3.0'
gem 'sinatra', require: false
gem 'devise-async'

# i18n
gem 'devise-i18n', '~> 0.11.2'
gem 'rails-i18n', '~> 4.0.0'

# server
gem 'foreman'
gem 'passenger', '~> 5.0.0.beta3'
gem 'sentry-raven'

# utils
gem 'anima'

# views
gem 'gravtastic'
gem 'representable', '~> 2.1.3'
gem 'slim-rails'

group :development, :test do
  gem 'rspec-rails', '~> 3.2.0'
  gem 'letter_opener'
  gem 'pry-rails', '~> 0.3.2'
end

group :development do
  gem 'mina', require: false
end

group :test do
  gem 'capybara', '~> 2.4.4'
  gem 'factory_girl_rails', '~> 4.5.0'
end
