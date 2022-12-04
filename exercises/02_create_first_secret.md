### Create your first secret:

```

Secrets ➡ Enable new engine > select KV > select next

path: kv/developers/ansible

create new secret > 

path: vars

Secret Data: key = ansible_become_method    value = foo

```


Create a second secret at a new path

```

create new secret > 

path: extra_vars

Secret Data: key = ansible_pass    value = foo

```
