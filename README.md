# Welcome to the Brackets of Love Repo! 

## The Stack
### Backend
Ruby/Rails, Mysql, Rspec, Esbuild
### Frontend
React, Typescript, Tailwind, CSS, Mocha
* note on css, use tailwind as much as possible for styling, however when using css, create class names prefixed with the component or file name such as `dialog-header` rather than just `header`. I don't plan on dealing with css collisions so make sure classes are unique! 
### CI/CD
Docker, Kubernetes, Google Cloud, Github Actions 

## Local Development
You have two options, install everything on your local machine

OR

Install Docker and MySql and run the app using [docker-compose](https://docs.docker.com/compose/)

* Note: Any normal command needs docker-compose if using this method
```
docker-compose build
docker-compose up
// if it's your first time use the following from a command line
docker-compose run --rm test-app bundle install
docker-compose run --rm test-app bundle exec rails db:create:all db:schema:load
// or these from the apps Docker terminal
bundle install
bundle exec rails db:create:all db:schema:load
// 

```
*Note: any time you want to run a single command using docker-compose I suggest using test-app or test-react with the --rm option. By using these you wont kill your regular app pod and --rm will automatically remove the test-app pod when the command has run.

## Local Unit Testing
Ruby (Rspec) Tests
```
RAILS_ENV=test bundle exec rspec
or 
RAILS_ENV=test docker-compose run --rm test-app bundle exec rspec
```
React (Mocha) Tests
```
yarn test
or 
docker-compose run --rm test-react yarn test
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


## Minikube for Develop/Prod (this is not a common)
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
  - set up seeder


## Help
How to get on a pod `kubectl exec -it pod-name /bin/bash`

Installing mysql2 gem on windows https://github.com/brianmario/mysql2/issues/1210

Docker Compose guide - https://salzam.com/create-and-dockerize-rails-application-with-mysql-and-sidekiq/
- commands you may need can be run like `docker-compose run web rails db:migrate`

### Articles
https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d

deploy and scripts
https://skcript.com/svr/dockerize-a-rails-app-with-mysql-and-sidekiq/

set up with k8
https://medium.com/nycdev/deploy-to-a-managed-kubernetes-cluster-on-google-cloud-894d35b83619

