# 🚧🚧🚧🚧🚧 Under Construction 🚧🚧🚧🚧🚧

## 

### Consul: 

Pods goes in pending state due to podAntiAffinity rules.

Create 3 workers and it resolved this. Need to look into disabling this in the helm chart.

##

### Vault:

Need to init & unseal Vault!

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

##

### Terraform Cloud Operator:

Coming Soon!

##
