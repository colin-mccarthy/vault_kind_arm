# 🚧🚧🚧🚧🚧 Under Construction 🚧🚧🚧🚧🚧

## 

### Access Vault 


http://vault/8200


```
kubectl port-forward -n vault \
  svc/vault-ui 8200:8200
```  



/etc/hosts
```
127.0.0.1 vault
```



bind: address already in use unable to create listener: Error

`lsof -ti:8200 | xargs kill -9`



##

### Exercises:



[Exercise 00 - Notes](./exercises/00_notes.md)

[Exercise 01 - Create Auth method via CLI](./exercises/01_create_auth_method_via_cli.md)

[Exercise 02 - Create your first policy](./exercises/02_create_first_policy.md)

[Exercise 03 - Harbor as a Dockerhub proxy](./exercises/03_harbor-as-docker-proxy.md)

[Exercise 04 - Install the Tanzu CLI](./exercises/04_tanzu_cli_install.md)

[Exercise 05 - Install TAP](./exercises/05_tap_install.md)



##

### Terraform Cloud Operator:

Coming Soon!

