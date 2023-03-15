# Welcome to the Brackets of Love Repo! 


## Local Development
You have two options, install everything on your local machine

OR

Install Docker and MySql and run the app using [docker-compose](https://docs.docker.com/compose/)

* Note: Any normal command needs docker-compose if using this method
```
docker-compose build
docker-compose up
// if it's your first time use the following from a command line
docker-compose run app bundle install
docker-compose run app bundle exec rails db:create:all db:schema:load
// or these from the apps Docker terminal
bundle install
bundle exec rails db:create:all db:schema:load
// 

```

## Local Unit Testing
```
// if it's your first time
RAILS_ENV=test docker-compose run app bundle exec rails db:create db:schema:load 
//
bundle exec rspec
```


## Deployment Methodology
1. Make a PR against main using your branch
2. Ensure unit tests pass and build succeeds
3. Get one approval from another dev to move code to develop
4. Push to develop
    1. Checkout to local develop and `git pull origin develop`
    2. `git merge your-branch-name`
    3. `git push origin develop`
5. Ensure it [builds](https://github.com/daniel-chapdelaine/brackets-of-love/actions) correctly and then QA new functionality
6. Once satisfied, get [this guy's](https://github.com/daniel-chapdelaine) label on your PR and you are good to merge to main


## Minikube for Develop/Prod
Install docker/kubectl/minikube/kubectx/kubens
1. Start minikube which create a kubernetes environment locally
`minikube start`
2. Enable minikube ingress to forward traffic. Only needs to be done your first time!
`minikube addons enable ingress` 
3. Start tunnel for port forwarding
`minikube tunnel`
4. Deploy kube files

## TODO
  - when deploying prod don't forget to add:   
      `config.hosts << "url-of-brackets-of-love.k8s.com" `
  - google cloud budget
  - set up tests in githubactions
  - set up seeder




## Help

How to get on a mysql pod `kubectl exec -it pod-name /bin/bash`
How to get on a app pod `kubectl exec -it pod-name /bin/ash`

Installing mysql2 gem on windows https://github.com/brianmario/mysql2/issues/1210

Docker Compose guide - https://salzam.com/create-and-dockerize-rails-application-with-mysql-and-sidekiq/
- commands you may need can be run like `docker-compose run web rails db:migrate`

### Articles
https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d

deploy and scripts
https://skcript.com/svr/dockerize-a-rails-app-with-mysql-and-sidekiq/

set up with k8
https://medium.com/nycdev/deploy-to-a-managed-kubernetes-cluster-on-google-cloud-894d35b83619

