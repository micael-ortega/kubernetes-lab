#!/bin/bash

echo -e "\nš¦ - Creating docker images... \n"

docker build -t micaelortega/backend-k8s:1.0 backend/.
docker build -t micaelortega/database-k8s:1.0 database/.

echo -e "\nš - Pushing images to docker hub... \n"

docker push micaelortega/backend-k8s:1.0
docker push micaelortega/database-k8s:1.0

echo -e "\nā - Setting services k8s... \n"
kubectl apply -f ./services.yml

echo -e "\nā - Setting deployments k8s... \n"
kubectl apply -f ./deployment.yml