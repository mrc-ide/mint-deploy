#!/usr/bin/env bash
set -eEuo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

source .env
git -C mint pull
docker-compose pull
docker-compose -p "${SERVER}" up -d
