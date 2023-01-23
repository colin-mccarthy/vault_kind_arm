##

### Port forward:

`kubectl port-forward svc/vault 8200 -n vault`


### Set up DNS:

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

### Access Vault:

`http://vault/8200`

### Troubleshooting:

bind: address already in use unable to create listener: Error

`lsof -ti:8200 | xargs kill -9`




##

### Notes:

##

### Need to init & unseal Vault?


example:
```
kubectl -n vault exec -it vault-0 -- sh
kubectl -n vault exec -it vault-1 -- sh
kubectl -n vault exec -it vault-2 -- sh

vault operator init
vault operator unseal

kubectl -n vault exec -it vault-0 -- vault status
kubectl -n vault exec -it vault-1 -- vault status
kubectl -n vault exec -it vault-2 -- vault status
```



### Consul: 

Pods goes in pending state due to podAntiAffinity rules.

Created 3 workers and it resolved this. Need to look into disabling this in the Helm chart.

Using outdated Helm chart as new one requires K8s v1.21.0, meanwhile the ARM compatible container image I'm using is v1.20.0.

`--version 0.39.0`

