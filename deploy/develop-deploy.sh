#!/bin/sh -ex

# eval $(minikube -p minikube docker-env)

docker build --build-arg RAILS_MASTER_KEY=`cat ./config/master.key` -t develop/brackets-of-love:latest .

# TODO: REMOVE PROJECT ID
# TODO: ADD COMMITS TO TAGS

docker tag develop/brackets-of-love:latest us.gcr.io/brackets-of-love-379100/develop:latest
docker push us.gcr.io/brackets-of-love-379100/develop:latest
kubectl apply -f ./deploy/develop/
kubectl rollout restart deployment.apps/develop-app