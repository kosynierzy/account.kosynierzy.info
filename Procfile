web: ./bin/passenger start --socket ./tmp/sockets/passenger.sock
worker: ./bin/sidekiq -C config/sidekiq.yml --daemon --logfile ./log/sidekiq.log --pidfile ./tmp/pids/sidekiq.pid
