# ElasticSearch

## Installation

To install ElasticSearch using the bitnami chart you will first need to add the repo to helm(v3). You will only need to do this once and only if you haven't already setup this repo for another chart.

```sh
$ helm repo add bitnami https://charts.bitnami.com/bitnami
```

Install the chart with our values file:

```sh
$ helm install es -n %namespace% bitnami/elasticsearch -f values-production.yaml
```
