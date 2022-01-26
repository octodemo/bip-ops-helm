# Usage

Prerequisite: You must have the bip-ops-helm repo setup in helm:

```sh
$ helm repo add bip https://department-of-veterans-affairs.github.io/bip-ops-helm/
```

Install:

```sh
$ helm install consul-svc-cleaner consul-svc-cleaner --set env=stage8
```
