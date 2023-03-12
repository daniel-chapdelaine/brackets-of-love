# README


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

## Minikube for Develop
Install docker/kubectl/minikube/kubectx/kubens
1. Start minikube which create a kubernetes environment locally
`minikube start`
2. Enable minikube ingress to forward traffic. Only needs to be done your first time!
`minikube addons enable ingress` 
3. Start tunnel for port forwarding
`minikube tunnel`
4. Deploy kube files
-- deploy script

TODO
  1. when deploying prod don't forget to add:   
      `config.hosts << "url-of-brackets-of-love.k8s.com" `
  2. google cloud budget


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

