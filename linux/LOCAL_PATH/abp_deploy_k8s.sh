#!/bin/bash

set -xeuo pipefail

die() { echo "ERROR: $*" 1>&2 ; exit 1; }

echo -e "Deleting old resources..."
# kubectl delete deployments/datadog-cluster-agent -n sandbox-a6h9
# kubectl delete daemonset datadog -n sandbox-a6h9
# kubectl delete service datadog-custom-metrics-server -n sandbox-a6h9
# kubectl delete APIService v1beta1.external.metrics.k8s.io
# kubectl delete hpa datadog-hpa-dquality-celery-queue-length -n sandbox-a6h9

pushd /workspaces/dquality/deploy/kubernetes/
echo -e "Generating k8s YAML..."
./make-customer-yaml.sh anomalo-sandbox overlays/sandbox-a6h9 || die "Make Customer YAML failed"
echo -e "Using temporary Docker image from AWS ECR instead of prod image from GCR..."
sed -i 's/us-docker.pkg.dev\/anomalo-invpc\/anomalo-sandbox\/deploy-web:anomalo-sandbox/580663733917.dkr.ecr.us-west-1.amazonaws.com\/dquality\/deploy-web:anomalo-sandbox/' anomalo.yaml
echo -e "Kubectl Applying k8s resources..."
kubectl --context arn:aws:eks:us-west-2:580663733917:cluster/anomalo-staging --namespace sandbox-a6h9 apply -f anomalo.yaml || die "Kubectl apply failed"
popd
