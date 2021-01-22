# mint-deploy

Pre-requisites:

- Docker and Docker Compose
- Vault

To set up and run (can safely be repeated e.g. in order to update SSL cert): 

1. Log into Vault
1. `echo SERVER=mint >.env` (or `mint-dev` for staging server - this matches path in Vault and filter in Kibana)
1. `./setup.sh`

To subsequently update to latest mint/mintr:

1. `./update.sh`
