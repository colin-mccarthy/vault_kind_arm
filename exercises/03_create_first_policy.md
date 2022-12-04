##

### Create your first policy


1. Policies ➡ create new ACL policy ➡ paste code from `secret_policy`

2. Access ➡ userpass ➡ edit user ➡ Tokens ➡ Generated Token's Policies ➡ add your new `secret_policy`

3. log out ➡ log back in

4. User should now see secret engine metadata for `kv/developers/ansible`


secret_policy
```
path "kv/developers/ansible/metadata/users/"{
capabilities = ["list"]
}
```

##

more examples:
```
path "kv/metadata/users/"{
capabilities = ["list"]
}
```
