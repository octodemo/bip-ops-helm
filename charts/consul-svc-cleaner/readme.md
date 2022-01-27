# Usage

Prerequisite: You must have the bip-ops-helm repo setup in helm:

```sh
$ helm repo add bip https://department-of-veterans-affairs.github.io/bip-ops-helm/
```

## Install

```sh
$ helm install consul-svc-cleaner bip/consul-svc-cleaner --set env=stage8
```

Notes:
* The default for `env` is prod8 so that is not necessary in production.
* You can make a dry run before deploying by adding `--dry-run`

## Manual Run [Optional]

If you deployed the job but want to run it manually for testing, you can run the following command:

```sh
$ kubectl create job manual-run --from cronjob/consul-svc-cleaner
```

Do not forget to clean up the job afterwards though.

```sh
$ kubectl delete job manual-run
```
