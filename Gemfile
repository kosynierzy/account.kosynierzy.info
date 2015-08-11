source 'https://rubygems.org'

ruby '2.0.0'

# core
gem 'rails', '~> 4.2.0'
gem 'envied', '~> 0.8.1'
gem 'pg'
gem 'coveralls', require: false

# assets
gem 'coffee-rails', '~> 4.1.0'
gem 'sass-rails', '~> 5.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'neat', '~> 1.7.1'
gem 'normalize-rails', '~> 3.0'

# authentication
gem 'devise', '~> 3.5.1'
gem 'doorkeeper', '~> 2.2.0'

# background-processing
gem 'sidekiq', '~> 3.0'
gem 'sinatra', require: false
gem 'devise-async'

# i18n
gem 'devise-i18n', '~> 0.12.0'
gem 'rails-i18n', '~> 4.0.3'

# server
gem 'foreman'
gem 'sentry-raven'

# utils
gem 'anima'

# views
gem 'gravtastic'
gem 'representable', '~> 2.2.3'
gem 'slim-rails'

group :development, :test do
  gem 'rspec-rails', '~> 3.3.1'
  gem 'letter_opener'
  gem 'pry-rails', '~> 0.3.3'
end

group :development do
  gem 'mina', require: false
  gem 'puma', '~> 2.12.2'
end

group :test do
  gem 'capybara', '~> 2.4.4'
  gem 'factory_girl_rails', '~> 4.5.0'
end

group :production do
  gem 'passenger', '~> 5.0.1'
end
