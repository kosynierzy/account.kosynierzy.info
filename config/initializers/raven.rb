require 'raven'

Raven.configure do |config|
  config.dsn = Figaro.env.raven_url
  config.environments = [Rails.env] - %w[ development test ]
  config.tags = { environment: Rails.env }
end
