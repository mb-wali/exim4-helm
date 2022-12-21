# EXIM4 Helm
A Helm chart to provide a exim4 deployment, exim4 (MTA) running as a smarthost.

The MTA is based on [Exim4](https://www.exim.org/). The Image was inspired by the Docker Image from [imixs/exim4](https://hub.docker.com/r/imixs/exim4). The Docker image is based on debian:jessie.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.7+

## Get Repository Info

```console
helm repo add exim4 https://mb-wali.github.io/exim4-helm
helm repo update
```

## Install Chart

```bash
Helm install [RELEASE_NAME] exim4/exim4 

# Install with --set values
Helm install [RELEASE_NAME] --set secrets.SMARTHOST='localhost',secrets.EXIM_PASSWORD='passw0rd' exim4/exim4 
```

## Environment

exim4 provides the following environment variables

* EXIM_SMARTHOST - your target mail server 
* EXIM_PASSWORD - authenticating to a remote host as a client.
* EXIM\_ALLOWED\_SENDERS - allowed sender IP/Network addresses (default=172.17.0.0/24:127.0.0.1)
* EXIM\_MESSAGE\_SIZE\_LIMIT - overwrites the default message_size_limit of 50m 

## local helm install
```bash
helm install exim4 Charts/exim4/ --dry-run
```
