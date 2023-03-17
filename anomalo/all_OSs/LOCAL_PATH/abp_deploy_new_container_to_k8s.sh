#!/bin/bash

die() { echo "ERROR: $*" 1>&2 ; exit 1; }

pushd /workspaces/dquality/

if [[ "${1-""}" == "web" ]]; then
  BUILD_SCRIPT_ID="web"
  DOCKER_IMG_ID="dquality/deploy-web"
elif [[ "${1-""}" == "1cd" ]]; then
  BUILD_SCRIPT_ID="one-click-deployer"
  DOCKER_IMG_ID="anomalo/oneclickdeployer"
else
  die "First argument must be 'web' or '1cd', but it's '${1-(empty)}'"
fi

echo -e "Deleting existing containers"
docker image rm 580663733917.dkr.ecr.us-west-1.amazonaws.com/${DOCKER_IMG_ID}:$(git rev-parse --abbrev-ref HEAD)
docker image rm 580663733917.dkr.ecr.us-west-1.amazonaws.com/${DOCKER_IMG_ID}:anomalo-sandbox

set -xeuo pipefail

echo -e "Building ${DOCKER_IMG_ID} Docker container..."
deploy/docker/build.sh ${BUILD_SCRIPT_ID}

echo -e "Retagging ${DOCKER_IMG_ID} as deploy-web:anomalo-sandbox..."
docker tag 580663733917.dkr.ecr.us-west-1.amazonaws.com/${DOCKER_IMG_ID}:$(git rev-parse --abbrev-ref HEAD) 580663733917.dkr.ecr.us-west-1.amazonaws.com/${DOCKER_IMG_ID}:anomalo-sandbox

echo -e "Pushing Docker image..."
docker push 580663733917.dkr.ecr.us-west-1.amazonaws.com/${DOCKER_IMG_ID}:anomalo-sandbox

#clear
echo -e "Available Docker images:"
docker image ls --digests | grep $DOCKER_IMG_ID

echo -e "Deploying to k8s..."
abp_deploy_k8s.sh

popd
