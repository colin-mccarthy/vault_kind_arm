##

### Set Up


```
kubectl -n vault exec -it vault-0 -- sh

vault login

vault secrets enable database
```

```
`helm install postgres .`

`k get pods`

`k patch deployment postgres --patch "$(cat patch.yaml)"`

`k get pods`

```
