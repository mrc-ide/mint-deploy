#!/usr/bin/env bash
set -eEuo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

source .env
export VAULT_ADDR=https://vault.dide.ic.ac.uk:8200
vault read -field=certificate "secret/${SERVER}/ssl" >ssl/certificate.pem
vault read -field=key "secret/${SERVER}/ssl" >ssl/key.pem && chmod 600 ssl/key.pem
[ -d "mint" ] || git clone https://github.com/mrc-ide/mint.git
docker-compose -p "${SERVER}" up -d
