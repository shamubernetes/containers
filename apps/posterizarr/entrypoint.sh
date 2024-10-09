#!/bin/bash

# Copy any missing files from /configtmp to /config
# This is useful when mounting a config volume to /config
# ignore any errors since the /config directory might not be writable
cp -R -u -p /configtmp/* /config || true

/scripts/injectVars.sh

exec pwsh -File /app/Posterizarr.ps1 "$@"
