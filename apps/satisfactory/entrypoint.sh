#!/usr/bin/env bash

printf "===== Satisfactory Server =====\\n\\n"

source /app/scripts/lib.sh

# prevent large logs from accumulating by default
if [[ "${LOG,,}" != "true" ]]; then
     logz "Clearing old Satisfactory logs (set LOG=true to disable this)"
    if [ -d "/config/gamefiles/FactoryGame/Saved/Logs" ] && [ -n "$(find /config/gamefiles/FactoryGame/Saved/Logs -type f -print -quit)" ]; then
        rm -r /config/gamefiles/FactoryGame/Saved/Logs/*
    fi
fi

if [[ ! -w "/config" ]]; then
    errorz "The current user does not have write permissions for /config"
fi

mkdir -p \
    "${CONFIGDIR}/backups" \
    "${CONFIGDIR}/gamefiles" \
    "${CONFIGDIR}/logs/steam" \
    "${CONFIGDIR}/saved/blueprints" \
    "${CONFIGDIR}/saved/server" \
    "${GAMECONFIGDIR}/Config/LinuxServer" \
    "${GAMECONFIGDIR}/Logs" \
    "${GAMESAVESDIR}/server" \
    "${HOMEDIR}/.steam/root" \
    "${HOMEDIR}/.steam/steam" \
    || exit 1

exec /app/scripts/run.sh "$@"
