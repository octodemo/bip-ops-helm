# Summary

This deploys the "wlpxy" service in bip. This acts as a relay to the admin servers in VBMS Weblogic clusters.

The docker directory has the relevant Dockerfile(s) to build the two required images for this to work. They will need to be built and uploaded to Nexus **before** you try to deploy the helm chart or they will fail.
