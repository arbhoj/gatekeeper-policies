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
- Then create the `constraint` object
```
kubectl apply -f allowed-repos-example/allowed-repos-constraint.yaml
```
- Finally create the manifest to trigger the constraint. Use test-pod.yaml for examples where a specific object is not necessary. 
```
kubectl apply -f test-pod.yaml
```

The rego-tests directors contains an example of how to test a rego rule before injecting it into a `constrainttemplate`. In order to run it you will need to download the OPA cli. Then it can be run as follows
```
./opa test rego-tests/. -v
```
 
**Note:** 
- All the examples work on a namespace named `test` so create it before proceeding. 
- For the `https-send-example` apply the `httptestpod.yaml`manifest first as that will create the pod and service from which we are retrieving information at runtime.
