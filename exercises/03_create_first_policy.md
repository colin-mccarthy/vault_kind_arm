##

### Create your first policy


1. Policies ➡ create new ACL policy ➡ paste code from `secret_policy`

2. Access ➡ userpass ➡ edit user ➡ Tokens ➡ Generated Token's Policies ➡ add your new `secret_policy`

3. log out ➡ log back in

4. User should now see secret engine metadata for `kv/developers/ansible`


secret_policy
```
path "kv/developers/ansible/metadata/*"{
capabilities = ["list"]
}
```


##

### Now add a rule to allow a user to create, read, and update a secret


secret_policy
```
path "kv/developers/ansible/metadata/*"{
capabilities = ["list"]
}



path "kv/developers/ansible/data/*"{
capabilities = ["create", "read", "update"]
}



```

##

### Now add a rule to allow a user to delete secret


secret_policy
```
path "kv/developers/ansible/metadata/*"{
capabilities = ["list", "create", "read", "update", "delete"]
}



path "kv/developers/ansible/data/*"{
capabilities = ["create", "read", "update", "delete"]
}


path "kv/developers/ansible/delete/*"{
capabilities = ["delete", "update"]
}



```
