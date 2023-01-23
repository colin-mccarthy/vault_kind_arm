# 🚧🚧🚧🚧🚧 Under Construction 🚧🚧🚧🚧🚧



##

### Access Vault 

### port forward: 


```
kubectl port-forward svc/vault 8200 -n vault
```  


### set up DNS: 

/etc/hosts
```
127.0.0.1 vault
```




### Get root token:


`kubectl logs -f vault-0 -n vault`

```
WARNING! dev mode is enabled! In this mode, Vault runs entirely in-memory
and starts unsealed with a single unseal key. The root token is already
authenticated to the CLI, so you can immediately begin using Vault.

You may need to set the following environment variables:

    $ export VAULT_ADDR='http://[::]:8200'

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: <foo>
Root Token: <foo>

Development mode should NOT be used in production installations!
```


### access GUI:

`http://vault/8200`   



### Troubleshooting:

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

