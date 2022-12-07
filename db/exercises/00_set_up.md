##

### Set Up

```
helm install postgres . --namespace vault
```


```
kubectl -n vault exec -it vault-0 -- sh

vault login

vault secrets enable database
```
