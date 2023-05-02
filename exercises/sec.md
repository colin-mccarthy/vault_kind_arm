Applying Policy to a namespace:

Policies are applied to a namespace via labels. These labels are as follows:

```
REQUIRED: pod-security.kubernetes.io/<MODE>: <LEVEL>
OPTIONAL: pod-security.kubernetes.io/<MODE>-version: <VERSION> (defaults to latest)
```
  
The following command warns the baseline Pod Security Standard pinned to v1.22 of the policy on the test-ns namespace.
  
```
kubectl create ns test-ns
```

```
kubectl label --overwrite ns test-ns \
  pod-security.kubernetes.io/warn=baseline \
  pod-security.kubernetes.io/warn-version=v1.26
```
  
 
Create Role:  
  
```
  vault write auth/kubernetes/role/internal-app \
    bound_service_account_names=internal-app \
    bound_service_account_namespaces=test-ns \
    policies=internal-app \
    ttl=24h
```

Create SA:
  
```
kubectl create sa internal-app -n test-ns
```

  
Create Deployment:
  
```
kubectl apply -f deployment.yaml -n test-ns
```  


##

I tested a few times with dry-run and an insecure deployment manifest.

I used `kubectl label --dry-run=server --overwrite ns --all \ pod-security.kubernetes.io/enforce=restricted` I saw the warnings start to go away once I modified the manifest with all the security settings. The seccompProfile warning went away when I added the annotations.


Unsecured:

Warning: orgchart-78b559df9c-7zr2w: allowPrivilegeEscalation != false, unrestricted capabilities, runAsNonRoot != true, seccompProfile
namespace/test-ns labeled (server dry run)

Secured:

