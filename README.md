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
docker-compose run app bundle install
docker-compose run app rails db:setup
docker-compose build
docker-compose up
```

Update hosts file

Install docker/kubectl/minikube/kubectx/kubens
1. Start minikube which create a kubernetes environment locally
`minikube start`
2. Enable minikube ingress to forward traffic. Only needs to be done your first time!
`minikube addons enable ingress` 
3. Start tunnel for port forwarding
`minikube tunnel`
4. Deploy kube files
-- deploy script

https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d

TODO

  1. configure GCP for autopilot 
  2. figure out if we can have two seperate host urls
  3. when deploying dev don't forget to add:   
      `config.hosts << "url-of-brackets-of-love.k8s.com" `



## Help

How to get on a mysql pod `kubectl exec -it pod-name /bin/bash`
How to get on a app pod `kubectl exec -it pod-name /bin/ash`

Installing mysql2 gem on windows https://github.com/brianmario/mysql2/issues/1210

Docker Compose guide - https://salzam.com/create-and-dockerize-rails-application-with-mysql-and-sidekiq/
- commands you may need can be run like `docker-compose run web rails db:migrate`


## Todo: 
When using docker look into /usr/local/bin/ruby: warning: shebang line ending with \r may cause problems
https://stackoverflow.com/questions/38905135/why-wont-my-docker-entrypoint-sh-execute

https://stackoverflow.com/questions/10418975/how-to-change-line-ending-settings

https://github.com/IIC2143-2021-1/Syllabus/issues/96
