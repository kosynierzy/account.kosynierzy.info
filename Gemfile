source "https://rubygems.org"

ruby "2.2.3"

# core
gem "rails", "~> 4.2.0"
gem "envied", "~> 0.8.1"
gem "pg", "~> 0.18.2"
gem "coveralls", "~> 0.8.2", require: false

# assets
gem "coffee-rails", "~> 4.1.0"
gem "sass-rails", "~> 5.0.3"
gem "uglifier", "~> 2.7.2"
gem "neat", "~> 1.7.2"
gem "normalize-rails", "~> 3.0.3"

# authentication
gem "devise", "~> 3.5.2"
gem "doorkeeper", "~> 3.0.0"
gem "doorkeeper-i18n"

# background-processing
gem "sidekiq", "~> 4.0.1"
gem "sinatra", "~> 1.4.6", require: false
gem "devise-async", "~> 0.10.1"

# i18n
gem "devise-i18n", "~> 0.12.1"
gem "rails-i18n", "~> 4.0.4"

# server
gem "foreman", "~> 0.78.0"
gem "sentry-raven", "~> 0.15.2"

# utils
gem "anima", "~> 0.3.0"

# views
gem "gravtastic", "~> 3.2.6"
gem "multi_json", "~> 1.11.2"
gem "representable", "~> 2.4.0"
gem "slim-rails", "~> 3.0.1"

group :development, :test do
  gem "brakeman", "~> 3.1.0"
  gem "rspec-rails", "~> 3.4.0"
  gem "letter_opener", "~> 1.4.1"
  gem "pry-rails", "~> 0.3.4"
end

group :development do
  gem "mina", "~> 0.3.7", require: false
  gem "puma", "~> 2.15.3"
end

group :test do
  gem "capybara", "~> 2.5.0"
  gem "factory_girl_rails", "~> 4.5.0"
end

group :production do
  gem "passenger", "~> 5.0.16"
end
