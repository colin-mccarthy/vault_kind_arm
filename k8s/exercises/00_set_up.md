##

### Set up:

##


## Exec into the vault container

`kubectl -n vault exec -it vault-0 -- sh`

find your address

```
/ $
/ $ echo $KUBERNETES_PORT_443_TCP_ADDR
10.96.0.1
/ $ 
```


## enable k8s auth method via gui

add hostname `https://10.96.0.1:443`



### create service account

`kubectl create sa internal-app`


### create policy

internal-app

```
path "internal/data/database/config"{
capabilities = ["read"]
}
```


### create role

name: internal-app
ServiceAccount: internal-app
policy: internal-app


### create secret

internal/database/config > key,value




### deploy app

`k apply -f deployment.yaml`

`k exec -it orgchart-f4c6cbd47-sj962 -c vault-agent  -- sh`

`cat vault/secrets/database-config.txt`






##

### resources

https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-secrets-engine
