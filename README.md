# BIP Ops Helm Charts

## Summary

This repository is for [helm](https://helm.sh) charts used by BIP Ops teams. **Please do not commit any IPs, passwords, or otherwise sensitive data.**

## Charts

| Name                                                     | Purpose |
| -------------------------------------------------------- | ------- |
| [deployment-scaler-cr](charts/deployment-scaler-cr/)     | Deploys the Kuberentes ClusterRole necessary for nightly-scale |
| [elastic-go](charts/elastic-go/)                         | Deploys a pod with [elastic-go](https://github.com/Rolinh/elastic-go) installed for easy querying of ES. |
| [elastichq](charts/elastichq/)                           | Deploys a pod and necessary ingress to use [elastichq](https://www.elastichq.org) to view and debug ES with a web interface. |
| [elasticsearch-exporter](charts/elasticsearch-exporter/) | Deploys a pod that monitors ES and exports data in a [Prometheus](https://prometheus.io) format for ingestion. |
| [fluentd](charts/fluentd/)                               | Deploys everything necessary for [fluentd](https://www.fluentd.org) to ingest Kubernetes pod logs and forward them on to ES. |
| [nightly-scale](charts/nightly-scale/)                   | Deploys Kubernetes [cronjobs](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/) that will scale down and back up deployments during nightly activities such as database refreshes. |
| [proxy](charts/proxy/)                                   | Deploys a proxy that can be used to handle connections to assets outside the kubernetes cluster such as S3. Can also setup oauth access controls on specific endpoints. |
