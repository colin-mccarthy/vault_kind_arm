##

### Vault:

Create Auth method via CLI:


example:
```
kubectl -n vault exec -it vault-0 -- vault status

kubectl -n vault exec -it vault-0 -- sh

vault login

vault auth enable userpass

vault write auth/userpass/users/spongebob password=krustykrab



```

