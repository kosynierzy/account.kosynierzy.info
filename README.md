[![Build status](https://travis-ci.org/kosynierzy/account.kosynierzy.info.png)](https://travis-ci.org/kosynierzy/account.kosynierzy.info)
[![Code Climate](https://codeclimate.com/github/kosynierzy/account.kosynierzy.info.png)](https://codeclimate.com/github/kosynierzy/account.kosynierzy.info)
[![Dependency Status](https://gemnasium.com/kosynierzy/account.kosynierzy.info.png)](https://gemnasium.com/kosynierzy/account.kosynierzy.info)
[![Coverage Status](https://coveralls.io/repos/kosynierzy/account.kosynierzy.info/badge.png)](https://coveralls.io/r/kosynierzy/account.kosynierzy.info)

# Requirements

* [Postgresql](http://www.postgresql.org/) 9.3.x
* [Beanstalkd](http://kr.github.io/beanstalkd/) 1.9.x
* [Ruby](https://www.ruby-lang.org/pl/) 2.1.x

# Development

* `cp config/database.example.yml config/database.yml`
* `cp config/application.example.yml config/application.yml`
* `bundle exec rake db:setup`
* `rails server`
