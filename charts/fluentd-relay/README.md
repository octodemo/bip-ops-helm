# fluentd-relay

This chart installs the necessary components to setup a fluentd-relay. It will listen on http for json objects and forward them on to ES. This tool is mainly used only for troubleshooting. It does not care about k8 pod logs or anything else.

# Purpose

The purpose of this application is to setup a relay to be used during troubleshooting efforts to filter out and possibly parse logs separate from the normal log collection does by the rest of the infrastructure.
