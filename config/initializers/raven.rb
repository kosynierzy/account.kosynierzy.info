require 'raven'

Raven.configure do |config|
  config.dsn = ENVied.RAVEN_URL
  config.environments = [Rails.env] - %w[ development test ]
  config.tags = { environment: Rails.env }
end
