# S3 Proxy

## Installation

The first thing you will need to do before deploying this proxy is to manually install
the tls cert/key and use the secret name you use in values.yaml as `secretName`.
The easiest way to do this is by running the following:

```sh
$ kubectl create secret tls -n %namespace% %nameofsecret% --key %pathtokeyfile% --cert %pathtocertfile%
```

After you have installed the necessary cert/key, you will need to update the values.yaml
file to include each endpoint under `endpoints`. Below is an example endpoint.

```yaml
endpoints:
  - host: s3.bpds.prod8.bip.va.gov
    s3: bip-bpds-prod.s3.us-gov-west-1.amazonaws.com
```

Then you can install/update the proxy:

```sh
# Run from the directory of this readme file.
$ helm3 install -n %namespace% pxy .
```
