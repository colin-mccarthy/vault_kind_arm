# 🚧🚧🚧🚧🚧 Under Construction 🚧🚧🚧🚧🚧



This repo supports standing up Vault on KinD using Docker or Podman.

Just run the appropriate shell script above depending on your provider.


example:

`bash vault_kind_podman.sh` or `bash vault_kind_docker.sh`


These scripts have been tested on my M1 ARM Macbook but should work on Intel as well.


##

### Set Up:



[Exercise 00 - Set Up](./exercises/00_setup.md)



##

### Exercises:



[Exercise 01 - Create Auth method via CLI](./exercises/01_create_auth_method_via_cli.md)

[Exercise 02 - Create your first secret 🖥-GUI](./exercises/02_create_first_secret.md)

[Exercise 03 - Create your first policy 🖥-GUI](./exercises/03_create_first_policy.md)

[Exercise 04 - Create a policy via CLI](./exercises/04_create_policy_cli.md)

[Exercise 05 - Under Construction 👷‍♂️](./exercises/00_notes.md)

[Exercise 06 - Under Construction 👷‍♂️](./exercises/00_notes.md)


##

### K8s secret injection using sidecar:



[Exercise 00 - Set up with 🖥-GUI](./k8s/exercises/00_set_up.md)

[Exercise 01 - Set up with CLI 👷‍♂️](./k8s/exercises/01_set_up_cli.md)


##

### Security:



[Exercise 01 - Under Construction 👷‍♂️](./db/exercises/sec.md)




##

### Dynamic db secrets:



[Exercise 00 - Under Construction 👷‍♂️](./db/exercises/00_set_up.md)

[Exercise 01 - Under Construction 👷‍♂️](./db/exercises/00_set_up.md)



##

### Vault Enterprise License:

Check Vault license status

```
kubectl -n vault  exec -ti vault-0 -- vault license get
```

##

### Resources

https://developer.hashicorp.com/vault/docs/platform/k8s/helm/enterprise

https://medium.com/@LachlanEvenson/hands-on-with-kubernetes-pod-security-admission-b6cac495cd11

