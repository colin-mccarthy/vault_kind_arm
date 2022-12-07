##

### Set up:


Exec into the vault container

`kubectl -n vault exec -it vault-0 -- sh`

find your address
```
/ $
/ $ echo $KUBERNETES_PORT_443_TCP_ADDR
10.96.0.1
/ $ 
```
enable k8s auth method via gui

add hostname `https://10.96.0.1:443`

create service account

`kubectl create sa internal-app`


```
k patch deployment postgres --patch "$(cat patch.yaml)" 
```









##

### Clone the Learn Vault Kubernetes repo

`git clone https://github.com/hashicorp-education/learn-vault-kubernetes/`


Create a new namespace in Kubernetes
`kubectl create namespace demo`


Start up an nginx server on your KinD cluster
`kubectl run nginx --image=nginx --namespace demo`


Create and initialize Kubernetes secrets engine on vault

`vault secrets enable kubernetes`


##

### resources

https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-secrets-engine
