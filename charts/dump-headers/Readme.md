# dump-headers
---

This chart will install a single pod that is designed to listen on an http port (default: 8080) and dump the request http headers to stdout. This is meant as a temporary service and only for testing purposes.

# Parameters
---

| Name | Description | Value |
| --- | --- | --- |
| `image` | The docker image to deploy. | `"container-registry.sbx8.bip.va.gov/ops/dump-headers"` |
| `ingress.enabled` | Whether to install the ingress | `true` |
| `ingress.host` | The hostname for the ingress | `NO DEFAULT` |
| `port` | The port used by the pod and service | `8080` |
| `tag` | The docker tag for the image deployed | `"latest"` |