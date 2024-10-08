#!/usr/bin/env bash

CURRENTUID=$(id -u)
HOMEDIR="${HOMEDIR:-/app}"
MSGERROR="\033[0;31mERROR:\033[0m"
USER="${USER:-steam}"
CONFIGDIR="${CONFIGDIR:-/config}"
GAMECONFIGDIR="${CONFIGDIR}/gamefiles/FactoryGame"
STEAMCMDDIR="${HOMEDIR}/steamcmd"
GAMECONFIGDIR="${CONFIGDIR}/gamefiles/FactoryGame/Saved"
GAMESAVESDIR="${HOMEDIR}/.config/Epic/FactoryGame/Saved/SaveGames"

# Default values
AUTOSAVENUM="${AUTOSAVENUM:-5}"
MAXOBJECTS="${MAXOBJECTS:-2162688}"
MAXTICKRATE="${MAXTICKRATE:-120}"
CONNECTION_TIMEOUT="${CONNECTION_TIMEOUT:-300}"
INITIAL_CONNECT_TIMEOUT="${INITIAL_CONNECT_TIMEOUT:-300}"
SERVERSTREAMING="${SERVERSTREAMING:-0}"
MAXPLAYERS="${MAXPLAYERS:-4}"
DISABLESEASONALEVENTS="${DISABLESEASONALEVENTS:-}"
SERVERGAMEPORT="${SERVERGAMEPORT:-7777}"

logz() {
    echo -e "$@"
}

errorz() {
    logz "$MSGERROR $@"
    exit 1
}

numcheckz() {
  [[ ! "$1" =~ ^[0-9]+$ ]] && return 1 || return 0
}

