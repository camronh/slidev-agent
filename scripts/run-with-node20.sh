#!/usr/bin/env bash
set -euo pipefail

NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
NVM_SCRIPT="$NVM_DIR/nvm.sh"

if [ -s "$NVM_SCRIPT" ]; then
  # shellcheck disable=SC1090
  source "$NVM_SCRIPT"
  nvm use --silent lts/iron >/dev/null
else
  echo "nvm shim not found at $NVM_SCRIPT; ensure Node 20 is available" >&2
fi

exec "$@"
