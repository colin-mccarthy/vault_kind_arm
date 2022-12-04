##

### Set up:


exec into the vault container

`kubectl -n vault exec -it vault-0 -- sh`

find your address
```
/ $
/ $ echo $KUBERNETES_PORT_443_TCP_ADDR
10.96.0.1
/ $ 
```
