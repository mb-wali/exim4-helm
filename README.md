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
helm install [RELEASE_NAME] exim4/exim4 --namespace [NAMESPACE] --create-namespace --wait

# Install with --set values
helm install exim4 --set secrets.EXIM_SMARTHOST='localhost',secrets.EXIM_PASSWORD='passw0rd',secrets.EXIM_ALLOWED_SENDERS='*' exim4/exim4 --namespace mail --create-namespace --wait
```

## Environment

exim4 provides the following environment variables

* EXIM_SMARTHOST - your target mail server 
* EXIM_PASSWORD - authenticating to a remote host as a client.
* EXIM\_ALLOWED\_SENDERS - allowed sender IP/Network addresses (default=172.17.0.0/24:127.0.0.1)
* EXIM\_MESSAGE\_SIZE\_LIMIT - overwrites the default message_size_limit of 50m (default=255M) 

## Debugging

Once the pod is running

```bash
# execute shell 
kubectl exec -it exim4-6ff546fb9f-ff47m -- bash

# send a test mail
echo "This is test" | mail -s "The subject" reciever@myhost.com -aFrom:sender@myhost.com
```

## Usage

Use your deployed exim4 to send mails, 
e.g. connect from a another service.

```bash
SMTP_HOST=exim4.mail.svc.cluster.local
```

## helm install [local]

```bash
helm install exim4 Charts/exim4/ --namespace mail --create-namespace --wait --dry-run
```
