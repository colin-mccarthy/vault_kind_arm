##

### Create your first policy


1. Policies > create new ACL policy > paste 

2. Access > userpass > edit user > Tokens > Generated Token's Policies

3. log out > log back in

4. user should now see secret engine metadata


secret_policy
```
path "kv/metadata/users/"{
capabilities = ["list"]
}
```

example
```
path "kv/developers/ansible/metadata/users/"{
capabilities = ["list"]
}
```

