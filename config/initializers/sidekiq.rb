Sidekiq.configure_server do |config|
  config.redis = { namespace: "account:#{Rails.env}:sidekiq" }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "account:#{Rails.env}:sidekiq" }
end
