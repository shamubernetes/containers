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
