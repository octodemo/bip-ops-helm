# Benefits Integrated Platform Operational Helm Charts

## Summary

The purpose of this repository is to house helm charts for operations tasks. This is to include temporary charts used for troubleshooting ongoing issue and also long running apps that help facilitate tenant workloads (eg: s3 proxies).

To use this repository, you must first add it to [helm](https://helm.sh):

```sh
helm repo add bip https://department-of-veterans-affairs.github.io/bip-ops-helm/
```

Refresh your local cache:

```sh
helm repo update
```

Install a chart from the repo:

```sh
helm install dump-headers bip/dump-headers --set ingress.host=dump-headers.bip.va.gov
```

## Charts

Some, but not all, charts are listed below for reference:

| Name                                                     | Purpose |
| -------------------------------------------------------- | ------- |
| [deployment-scaler-cr](charts/deployment-scaler-cr/)     | Deploys the Kuberentes ClusterRole necessary for nightly-scale |
| [elastic-go](charts/elastic-go/)                         | Deploys a pod with [elastic-go](https://github.com/Rolinh/elastic-go) installed for easy querying of ES. |
| [elastichq](charts/elastichq/)                           | Deploys a pod and necessary ingress to use [elastichq](https://www.elastichq.org) to view and debug ES with a web interface. |
| [elasticsearch-exporter](charts/elasticsearch-exporter/) | Deploys a pod that monitors ES and exports data in a [Prometheus](https://prometheus.io) format for ingestion. |
| [fluentd](charts/fluentd/)                               | Deploys everything necessary for [fluentd](https://www.fluentd.org) to ingest Kubernetes pod logs and forward them on to ES. |
| [nightly-scale](charts/nightly-scale/)                   | Deploys Kubernetes [cronjobs](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/) that will scale down and back up deployments during nightly activities such as database refreshes. |
| [proxy](charts/proxy/)                                   | Deploys a proxy that can be used to handle connections to assets outside the kubernetes cluster such as S3. Can also setup oauth access controls on specific endpoints. |
