#!/bin/bash
#
#
#

set -oe errexit

# desired cluster name; default is "kind"
KIND_CLUSTER_NAME="vault"


echo "> initializing Kind cluster: ${KIND_CLUSTER_NAME}"

# create a cluster
cat <<EOF |  KIND_EXPERIMENTAL_PROVIDER=podman kind create cluster  --image kindest/node:v1.23.13 --name "${KIND_CLUSTER_NAME}" --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
EOF



echo " ✓ helm repo add hashicorp https://helm.releases.hashicorp.com 📦 "
##helm
helm repo add hashicorp https://helm.releases.hashicorp.com 



echo "> 😊😊 Verify Cluster install"

sleep 30

echo "> 😊😊 Verify Cluster install...."

sleep 30

echo "> 😊😊 Verify Cluster install...."

sleep 30

kubectl wait --for=condition=Ready=true node/vault-control-plane --timeout=30s



echo " ✓ kubectl create ns vault 📦 "

## Consul
#
#helm install consul hashicorp/consul --set global.name=consul --create-namespace --namespace vault --version 0.39.0
#


helm install vault hashicorp/vault --create-namespace --namespace vault --set='ui.enabled=true' --set='ui.serviceType=NodePort' --set 'server.dev.enabled=true'

sleep 30

echo "> done! 📦 "

kubectl get pods -n vault
