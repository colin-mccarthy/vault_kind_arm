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

```
`helm install postgres . --namespace vault`

`k -n vault get pods`

`k -n vault patch deployment postgres --patch "$(cat patch.yaml)"`

`k -n vault get pods`

```
