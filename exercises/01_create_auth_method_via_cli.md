##

### Vault:

Create Auth method via CLI:


example:

Get a shell on the container:
```
kubectl -n vault exec -it vault-0 -- vault status

kubectl -n vault exec -it vault-0 -- sh

```

Vault commands:
```

vault login

vault auth enable userpass

vault write auth/userpass/users/spongebob password=krustykrab

vault auth list

vault auth enable -path=colin -description="local credentials for colin" userpass

vault auth list

vault write auth/colin/users/colin password=root poicies=colin

vault list auth/colin/users

vault read auth/colin/users/colin

vault auth enable approle

vault write auth/approle/role/colin token_ttl=20m policies=colin

```

