Applying Policy to a namespace:

Policies are applied to a namespace via labels. These labels are as follows:

REQUIRED: pod-security.kubernetes.io/<MODE>: <LEVEL>
OPTIONAL: pod-security.kubernetes.io/<MODE>-version: <VERSION> (defaults to latest)
  
The following command warns the baseline Pod Security Standard pinned to v1.22 of the policy on the test-ns namespace.

```
kubectl label --overwrite ns test-ns \
  pod-security.kubernetes.io/warn=baseline \
  pod-security.kubernetes.io/warn-version=v1.26
```
