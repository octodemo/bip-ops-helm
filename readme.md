# BIP Ops Helm Charts

## Summary

This repository is for [helm](https://helm.sh) charts used by BIP Ops teams. **Please do not commit any IPs, passwords, or otherwise sensitive data.**

## Charts

| Name | Purpose |
| --- | --- |
| [consul-svc-cleaner](https://department-of-veterans-affairs.github.io/bip-ops-helm/charts/consul-svc-cleaner/) | Sets up a daily Kubernetes CronJob to clean up consul service healthchecks. |
| [dump-headers](https://department-of-veterans-affairs.github.io/bip-ops-helm/charts/dump-headers/) | Deploys a single pod that will output http headers to stdout. |

## Add repo to Helm

You can use this repository by adding it to your local helm repo list:

```sh
$ helm repo add bip https://department-of-veterans-affairs.github.io/bip-ops-helm/
```
