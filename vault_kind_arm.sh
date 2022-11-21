#!/bin/bash
#
#
#

set -oe errexit

# desired cluster name; default is "kind"
KIND_CLUSTER_NAME="vault"


echo "> initializing Kind cluster: ${KIND_CLUSTER_NAME}"

# create a cluster
cat <<EOF | kind create cluster  --image rossgeorgiev/kind-node-arm64:v1.20.0 --name "${KIND_CLUSTER_NAME}" --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
        authorization-mode: "AlwaysAllow"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF

echo " ✓ alias k=kubectl 📦 "
##alias
alias k=kubectl


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
##vault
helm install consul hashicorp/consul --set global.name=consul --create-namespace --namespace vault --version 0.39.0



echo "> done! 📦 "
