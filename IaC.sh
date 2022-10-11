#!/bin/bash

echo -e "\n📦 - Creating docker images... \n"

docker build -t micaelortega/backend-k8s:1.0 backend/.
docker build -t micaelortega/database-k8s:1.0 database/.

echo -e "\n🐋 - Pushing images to docker hub... \n"

docker push micaelortega/backend-k8s:1.0
docker push micaelortega/database-k8s:1.0

echo -e "\n⚓ - Setting services k8s... \n"
kubectl apply -f ./services.yml

echo -e "\n⚓ - Setting deployments k8s... \n"
kubectl apply -f ./deployment.yml