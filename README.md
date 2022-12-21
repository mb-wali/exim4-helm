# EXIM4 Helm
A Helm chart to provide a exim4 deployment, exim4 (MTA) running as a smarthost.

The MTA is based on [Exim4](https://www.exim.org/). The Image was inspired by the Docker Image from [imixs/exim4](https://hub.docker.com/r/imixs/exim4). The Docker image is based on debian:jessie.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.7+

## Get Repository Info

```console
helm repo add exim4 https://mb-wali.github.io/exim4-helm/
helm repo update
```

## Install Chart

```bash
# TODO
Helm install ....

# Install with override values
# TODO
```


## local helm install
```bash
helm install exim4 Charts/exim4/ --dry-run
```
