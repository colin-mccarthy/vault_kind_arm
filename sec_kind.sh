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
featureGates:
 PodSecurity: true
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        seccomp-default: "true"
        feature-gates: "SeccompDefault=true"
- role: worker
  kubeadmConfigPatches:
  - |
    kind: JoinConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        seccomp-default: "true"
        feature-gates: "SeccompDefault=true"
- role: worker
  kubeadmConfigPatches:
  - |
    kind: JoinConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        seccomp-default: "true"
        feature-gates: "SeccompDefault=true"
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



secret=$(cat vault.hclic)




