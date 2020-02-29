## How to install the CronJobs to automatically scale down deployments during the night for database refresh

The first thing that needs to be installed is the ClusterRole. This only needs to be done once because this is a global resource.

Verify the role isn't already there.

```
# Using Helm (must be v3+):
helm -n default ls
# Using kubectl
kubectl -n default get clusterrole deployment-scaler
```

If it isn't already installed then you can install using helm

```
# Execute from charts/ directory
helm -n default install deployment-scaler deployment-scaler
```

Next we will install the service account and cronjobs for the nightly scaling event.

```
# Claims ProdTest. Execute from charts/ directory
helm -n claims-prodtest install nightly-scale nightly-scale --values nightly-scale/values-claims-prodtest.yaml
# IBS ProdTest. Execute from charts/ directory
helm -n ibs-prodtest install nightly-scale nightly-scale --values nightly-scale/values-ibs-prodtest.yaml
```

We can verify the installation went successfully by manually verifying the assets created.

```
helm -n claims-prodtest ls
kubectl -n claims-prodtest get serviceaccount scaler # Verify ServiceAccount
kubectl -n claims-prodtest get rolebinding deployment-scaler-rb # Verify RoleBinding
kubectl -n claims-prodtest get cronjobs # Verify CronJobs
```

If everything looks good then you just need to wait overnight and verify if the jobs ran successfully.

```
kubectl -n claims-prodtest describe cronjob scale-up # Pay attention to the Last Scheduled Time
```

Now you're gravy.
