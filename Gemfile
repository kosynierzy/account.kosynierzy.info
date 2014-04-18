source 'https://rubygems.org'

ruby '2.1.1'

# core
gem 'rails', '4.0.4'
gem 'figaro', '~> 0.7.0'
gem 'pg'
gem 'coveralls', require: false

# assets
gem 'coffee-rails', '~> 4.0.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'neat', '~> 1.5.0'
gem 'normalize-rails', '~> 3.0'

# authentication
gem 'devise', '~> 3.2.3'
gem 'doorkeeper', '~> 1.1.0'

# background-processing
gem 'backburner', '~> 0.4.5'
gem 'beanstalkd_view', '~> 1.2.6'
gem 'devise-async', git: 'git://github.com/jandudulski/devise-async.git', branch: 'backburner'

# i18n
gem 'devise-i18n', '~> 0.10.2'
gem 'rails-i18n', '~> 4.0.0'

# server
gem 'puma'
gem 'sentry-raven'

# views
gem 'representable', '~> 1.8.0'
gem 'slim-rails'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta2'
  gem 'letter_opener'
  gem 'pry-rails', '~> 0.3.2'
end

group :development do
  gem 'foreman'
  gem 'mina'
end

group :test do
  gem 'capybara', '~> 2.2.1'
  gem 'factory_girl_rails', '~> 4.4.1'
end
