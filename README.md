# 🚧🚧🚧🚧🚧 Under Construction 🚧🚧🚧🚧🚧



##

### port forward: 


```
kubectl port-forward svc/vault 8200 -n vault
```  

## 

### Access Vault 


/etc/hosts
```
127.0.0.1 vault
```

`http://vault/8200`   `token=root`




bind: address already in use unable to create listener: Error

`lsof -ti:8200 | xargs kill -9`



##

### Exercises:



[Exercise 00 - Notes](./exercises/00_notes.md)

[Exercise 01 - Create Auth method via CLI](./exercises/01_create_auth_method_via_cli.md)

[Exercise 02 - Create your first secret 🖥-GUI](./exercises/02_create_first_secret.md)

[Exercise 03 - Create your first policy 🖥-GUI](./exercises/03_create_first_policy.md)

[Exercise 04 - Create a policy via CLI](./exercises/04_create_policy_cli.md)

[Exercise 05 - Under Construction 👷‍♂️](./exercises/00_notes.md)

[Exercise 06 - Under Construction 👷‍♂️](./exercises/00_notes.md)


##

### K8s secret injection using sidecar:



[Exercise 00 - Set up with 🖥-GUI](./k8s/exercises/00_set_up.md)

[Exercise 01 - Set up with CLI 👷‍♂️](./k8s/exercises/01_set_up_cli.md)




##

### Dynamic db secrets:



[Exercise 00 - Under Construction 👷‍♂️](./db/exercises/00_set_up.md)

[Exercise 01 - Under Construction 👷‍♂️](./db/exercises/00_set_up.md)



##

### Vault Enterprise License

https://developer.hashicorp.com/vault/docs/platform/k8s/helm/enterprise

