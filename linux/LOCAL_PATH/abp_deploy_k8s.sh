#!/bin/bash

set -xeuo pipefail

pushd /workspaces/dquality/deploy/kubernetes/
echo -e "Generating k8s YAML..."
./make-customer-yaml.sh anomalo-sandbox overlays/sandbox-a6h9
echo -e "Using temporary Docker image from AWS ECR instead of prod image from GCR..."
sed -i 's/us-docker.pkg.dev\/anomalo-invpc\/anomalo-sandbox\/deploy-web:anomalo-sandbox/580663733917.dkr.ecr.us-west-1.amazonaws.com\/dquality\/deploy-web:anomalo-sandbox/' anomalo.yaml
echo -e "Kubectl Applying k8s resources..."
kubectl apply -f anomalo.yaml
popd
