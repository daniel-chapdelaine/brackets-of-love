#!/bin/sh -ex

# eval $(minikube -p minikube docker-env)

docker build --build-arg RAILS_MASTER_KEY=`cat ./config/master.key` -t develop/brackets-of-love:latest .

# TODO: REMOVE PROJECT ID

docker tag develop/brackets-of-love:latest us.gcr.io/brackets-of-love-379100/develop:latest
docker push us.gcr.io/brackets-of-love-379100/develop:latest
#TODO: remove in kubernetes
# docker build -t my-image .
# docker push danielchapdelaine/kubernetes-rails-example:latest
# kubectl apply -f ./deploy/develop/_develop-namespace.yaml
# kubectl apply -f ./deploy/develop/develop-mysql-pv.yaml
# kubectl apply -f ./deploy/develop/develop-mysql-pvc.yaml
# kubectl apply -f ./deploy/develop/
# create db
# kubectl create -f ./deploy/develop/db/develop-db-create.yaml
# kubectl wait --for=condition=complete --timeout=40s job/develop-db-create
# kubectl delete job.batch/develop-db-create
# migrate db
# kubectl create -f ./deploy/develop/db/develop-db-migrate.yaml
# kubectl wait --for=condition=complete --timeout=600s job/develop-db-migrate
# kubectl delete job.batch/develop-db-migrate

# kubectl rollout restart deployment.apps/develop-app