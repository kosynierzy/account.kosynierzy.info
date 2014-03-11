[![Build status](https://travis-ci.org/kosynierzy/account.kosynierzy.info.png)](https://travis-ci.org/kosynierzy/account.kosynierzy.info)
[![Code Climate](https://codeclimate.com/github/kosynierzy/account.kosynierzy.info.png)](https://codeclimate.com/github/kosynierzy/account.kosynierzy.info)
[![Dependency Status](https://gemnasium.com/kosynierzy/account.kosynierzy.info.png)](https://gemnasium.com/kosynierzy/account.kosynierzy.info)
[![Coverage Status](https://coveralls.io/repos/kosynierzy/account.kosynierzy.info/badge.png)](https://coveralls.io/r/kosynierzy/account.kosynierzy.info)

# Requirements

* [Postgresql](http://www.postgresql.org/) 9.3.x
* [Beanstalkd](http://kr.github.io/beanstalkd/) 1.9.x
* [Ruby](https://www.ruby-lang.org/pl/) 2.1.x

# Development

* `bin/setup`
* `rails server`

# Example config for nginx

```
upstream account-rails {
  server 127.0.0.1:3000;
}

server {
    listen 80;
    server_name account.kosynierzy.dev;
    root /path/to/account.kosynierzy.info/public;

    try_files $uri/index.html $uri.html $uri @app;

    location @app {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;

        proxy_pass http://account-rails;
   }
}
```
