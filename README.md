# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Local Development
You may want to install Ruby/Rails/Bundler and run the app locally
OR
Install Docker and do the following:
```
cd development/
docker-compose run web bundle install
docker-compose run web rails db:setup
docker-compose build
docker-compose up
```

## Help Links

Installing mysql2 gem on windows https://github.com/brianmario/mysql2/issues/1210

Docker Compose guide - https://salzam.com/create-and-dockerize-rails-application-with-mysql-and-sidekiq/
- commands you may need can be run like `docker-compose run web rails db:migrate`


## Todo: 
When using docker look into /usr/local/bin/ruby: warning: shebang line ending with \r may cause problems
https://stackoverflow.com/questions/38905135/why-wont-my-docker-entrypoint-sh-execute

https://stackoverflow.com/questions/10418975/how-to-change-line-ending-settings

https://github.com/IIC2143-2021-1/Syllabus/issues/96
