# mint-deploy

Pre-requisites:

- Docker and Docker Compose
- Vault

To set up and run (can safely be repeated e.g. in order to update SSL cert): 

1. Log into Vault
1. `echo SERVER=mint >.env` (or `mint-dev` for staging server - this matches path in Vault and filter in Kibana)
1. `./mint-deploy up`

To update to latest mint/mintr and restart:

- `./mint-deploy pull`

To shut down:

- `./mint-deploy down`

If you need to deploy a branch other than `main` for the app and/or API you can specify via a `.env` file:

```shell
cat >.env <<EOF
API_BRANCH=mrc-2186
APP_BRANCH=mrc-2186
EOF
```
