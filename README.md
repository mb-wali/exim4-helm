# EXIM4 Helm
A Helm chart to provide a exim4 deployment, exim4 (MTA) running as a smarthost.

The MTA is based on [Exim4](https://www.exim.org/). The Image was inspired by the Docker Image from [imixs/exim4](https://hub.docker.com/r/imixs/exim4). The Docker image is based on debian:jessie.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.7+

## Add Helm Repository

```bash
helm repo add exim4 https://mb-wali.github.io/exim4-helm
helm repo update
```

## Installing the Chart
### Basic Installation

```bash
helm install [RELEASE_NAME] exim4/exim4 \
  --namespace [NAMESPACE] \
  --create-namespace \
  --wait
```

### Installation with Custom Values

```
helm install exim4 exim4/exim4 \
  --namespace mail \
  --create-namespace \
  --wait \
  --set secrets.EXIM_SMARTHOST='localhost' \
  --set secrets.EXIM_PASSWORD='passw0rd' \
  --set secrets.EXIM_ALLOWED_SENDERS='*'
```

## Configuration

The following environment variables can be configured via Helm values:

| Environment Variable       | Description                                                                  | Default                    |
|----------------------------|------------------------------------------------------------------------------|----------------------------|
| `EXIM_SMARTHOST`           | Address of the target mail server                                            | *(required)*               |
| `EXIM_PASSWORD`            | Password for authenticating to the remote smarthost                          | *(required if needed)*     |
| `EXIM_ALLOWED_SENDERS`     | Allowed sender IP addresses or CIDR networks                                 | `172.17.0.0/24:127.0.0.1`  |
| `EXIM_MESSAGE_SIZE_LIMIT`  | Overrides the default message size limit (default is 50M). Example: `255M`   | `255M`                     |


## Debugging

Once the pod is running, you can troubleshoot or test it with the following commands:

```bash
# Start an interactive shell in the Exim4 pod
kubectl exec -it exim4-6ff546fb9f-ff47m -- bash

# Example: Send a test email
echo "This is test" | mail -s "The subject" reciever@myhost.com -aFrom:sender@myhost.com
```

## Usage
Use the deployed Exim4 instance as your SMTP relay from other services within the cluster:

```bash
SMTP_HOST=exim4.mail.svc.cluster.local
```

## Local Installation for Testing

```bash
helm install exim4 Charts/exim4/ \
  --namespace mail \
  --create-namespace \
  --wait \
  --dry-run
```
