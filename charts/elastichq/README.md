# ElasticSearchHQ

## Installation

The only requirement for the installation of this chart is that you setup the tls certificate secret first. This can be done with the following command:

```sh
$ kubectl create secret tls elastichq-tls --cert %pathtocert% --key %pathtokey%
```

Note: If you want to use a different secret name then you will need to update values.yaml

After the certificate is installed, just run `helm install ehq .`
