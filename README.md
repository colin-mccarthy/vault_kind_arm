# 🚧🚧🚧🚧🚧 Under Construction 🚧🚧🚧🚧🚧

## 

### Consul: 

Pods goes in pending state due to podAntiAffinity rules.

Created 3 workers and it resolved this. Need to look into disabling this in the Helm chart.

Using outdated Helm chart as new one requires K8s v1.21.0 and the container image I'm using is v1.20.0.

`--version 0.39.0`

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
