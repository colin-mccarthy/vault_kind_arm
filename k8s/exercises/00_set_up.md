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


##

### Clone the Learn Vault Kubernetes repo

`git clone https://github.com/hashicorp-education/learn-vault-kubernetes/`


Create a new namespace in Kubernetes
`kubectl create namespace demo`


Start up an nginx server on your KinD cluster
`kubectl run nginx --image=nginx --namespace demo`


Create and initialize Kubernetes secrets engine on vault

`vault secrets enable kubernetes`
