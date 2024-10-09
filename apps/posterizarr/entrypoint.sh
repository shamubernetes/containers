#!/bin/bash

# Copy any mounted configs to the app directory
# This could be a config.json or fonts, anything Posterizarr uses

# shellcheck disable=SC2216
yes | cp -rf /config/* /app/config

# Inject environment variables into the config.json file
/scripts/injectVars.sh

exec pwsh -File /app/Posterizarr.ps1 "$@"
