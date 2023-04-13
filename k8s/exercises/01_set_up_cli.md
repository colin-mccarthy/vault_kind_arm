##

### Vault sidecar injection via CLI (KVv2)

##


## Exec into the vault container

```
kubectl exec -it hashicorp-vault-0  -- sh
```



## create a secret

```

vault secrets enable -path=internal kv-v2

vault kv put internal/database/config username="db-readonly-username" password="db-secret-password"
```


find your address


```
/ $
/ $ echo $KUBERNETES_PORT_443_TCP_ADDR
10.96.0.1
/ $ 
```


## enable k8s auth method
```
vault auth enable kubernetes

vault write auth/kubernetes/config \
    kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443"
```








## create policy 

```

vault policy write internal-app - <<EOF
path "internal/data/database/config" {
  capabilities = ["read"]
}
EOF
```

## create a role

```
vault write auth/kubernetes/role/internal-app \
    bound_service_account_names=internal-app \
    bound_service_account_namespaces=default \
    policies=internal-app \
    ttl=24h

exit
```



## create a service account

`kubectl create sa internal-app`




## deploy the app

`k apply -f deployment.yaml`

`k exec -it orgchart-f4c6cbd47-sj962 -c vault-agent  -- sh`

`cat vault/secrets/database-config.txt`



### resources

https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-sidecar

```
kubectl port-forward svc/hashicorp-vault 8200 
```

### 

```
kubectl exec -it hashicorp-vault-0  -- sh

vault secrets enable -path=internal kv-v2

vault kv put internal/database/config username="db-readonly-username" password="db-secret-password"


vault auth enable kubernetes

vault write auth/kubernetes/config \
    kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443"


vault policy write internal-app - <<EOF
path "internal/data/database/config" {
  capabilities = ["read"]
}
EOF


vault write auth/kubernetes/role/internal-app \
    bound_service_account_names=internal-app \
    bound_service_account_namespaces=default \
    policies=internal-app \
    ttl=24h

exit


kubectl get serviceaccounts

kubectl create sa internal-app

kubectl get serviceaccounts


kubectl apply -f deployment.yaml
```


```
kubectl exec -it orgchart-78b559df9c-jfr59   -- sh


cd /vault/secrets

ls

cat database-config.txt 

data: map[password:db-secret-password username:db-readonly-username]
metadata: map[created_time:2023-04-09T06:21:08.257897924Z custom_metadata:<nil> deletion_time: destroyed:false version:1]



