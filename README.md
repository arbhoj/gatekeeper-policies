# gatekeeper-policies
The purpose of this repo is to provide a few examples for Gatekeeper policies and cover a few common use-cases and how-to's. 
It provides  examples for working with data from:
- The object on which the policy is being applied (e.g. pod, service etc.), 
- The input parameters configured for the policy in the `constrainttemplate`
- Kubernetes data loaded into gatekeeper cache which is configured using `config` object
- Data that can be fetched at runtime using the `http.send` method.  

Each directory contains: 
- `contrainttemplate`
- corresponding `constraint` object
- example manifests to trigger the constraint

In order to test each:
- Create the `constrainttemplate`

```
kubectl apply -f allowed-repos-example/allowed-repos-template.yaml
```
- Then the `constraint` object
```
kubectl apply -f allowed-repos-example/allowed-repos-constraint.yaml
```
- Finally the manifest to trigger the constraint. Use test-pod.yaml for examples where a specific object is not necessary. 
```
kubectl apply -f test-pod.yaml
```


**Note:** 
- All the examples work on a namespace named `test` so create it before proceeding. 
- For the `https-send-example`apply the `httptestpod.yaml`manifest first as that will create the pod and service from which we are retrieving information at runtime.