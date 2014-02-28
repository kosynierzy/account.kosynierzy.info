Backburner.configure do |config|
  config.beanstalk_url = [Figaro.env.beanstalkd_url]
  config.tube_namespace = "account.kosynierzy.#{Rails.env}"
  config.on_error = lambda { |e| puts e }
  config.max_job_retries = 3
  config.retry_delay = 5
  config.default_priority = 65536
  config.respond_timeout = 120
  config.default_worker = Backburner::Workers::Simple
  # TODO: log to file
  config.logger = Logger.new(STDOUT)
  config.primary_queue = "mailer"
  config.priority_labels = { custom: 50, useless: 100 }
end
