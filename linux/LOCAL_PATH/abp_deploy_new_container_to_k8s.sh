#!/bin/bash

set -xeuo pipefail

pushd /workspaces/dquality/

echo -e "Building dquality-web Docker container..."
deploy/docker/build.sh web

echo -e "Retagging dquality-web as deploy-web:anomalo-sandbox..."
docker tag 580663733917.dkr.ecr.us-west-1.amazonaws.com/dquality/deploy-web:$(git rev-parse --abbrev-ref HEAD) 580663733917.dkr.ecr.us-west-1.amazonaws.com/dquality/deploy-web:anomalo-sandbox

echo -e "Pushing Docker image..."
docker push 580663733917.dkr.ecr.us-west-1.amazonaws.com/dquality/deploy-web:anomalo-sandbox

clear
echo -e "Available Docker images:"
docker image ls --digests | grep "web"

echo -e "Deploying to k8s..."
abp_deploy_k8s.sh

popd
