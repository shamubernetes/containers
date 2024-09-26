#!/usr/bin/env bash

source /app/scripts/lib.sh

AUTOSAVENUM="5"
MAXOBJECTS="2162688"
MAXTICKRATE="120"
TIMEOUT="300"
TIMEOUT="300"
SERVERSTREAMING="0"
MAXPLAYERS="4"
DISABLESEASONALEVENTS=""
SKIPUPDATE="false"
STEAMBETAFLAG="public"

# ini_args=(
#   "-ini:Engine:[Core.Log]:LogNet=Error"
#   "-ini:Engine:[Core.Log]:LogNetTraffic=Warning"
#   "-ini:Engine:[/Script/FactoryGame.FGSaveSession]:mNumRotatingAutosaves=$AUTOSAVENUM"
#   "-ini:Engine:[/Script/Engine.GarbageCollectionSettings]:gc.MaxObjectsInEditor=$MAXOBJECTS"
#   "-ini:Engine:[/Script/OnlineSubsystemUtils.IpNetDriver]:LanServerMaxTickRate=$MAXTICKRATE"
#   "-ini:Engine:[/Script/OnlineSubsystemUtils.IpNetDriver]:NetServerMaxTickRate=$MAXTICKRATE"
#   "-ini:Engine:[/Script/OnlineSubsystemUtils.IpNetDriver]:ConnectionTimeout=$TIMEOUT"
#   "-ini:Engine:[/Script/OnlineSubsystemUtils.IpNetDriver]:InitialConnectTimeout=$TIMEOUT"
#   "-ini:Engine:[ConsoleVariables]:wp.Runtime.EnableServerStreaming=$SERVERSTREAMING"
#   "-ini:Game:[/Script/Engine.GameSession]:ConnectionTimeout=$TIMEOUT"
#   "-ini:Game:[/Script/Engine.GameSession]:InitialConnectTimeout=$TIMEOUT"
#   "-ini:Game:[/Script/Engine.GameSession]:MaxPlayers=$MAXPLAYERS"
#   "-ini:GameUserSettings:[/Script/Engine.GameSession]:MaxPlayers=$MAXPLAYERS"
#   "$DISABLESEASONALEVENTS"
# )

/app/steamcmd/steamcmd.sh +force_install_dir /config/gamefiles +login anonymous +app_update "$STEAMAPPID" -beta "$STEAMBETAFLAG" validate +quit

printf "Launching game server\\n\\n"

if [ ! -f "/config/gamefiles/FactoryServer.sh" ]; then
    printf "FactoryServer launch script is missing.\\n"
    exit 1
fi

cd /config/gamefiles || exit 1

chmod +x FactoryServer.sh

exec ./FactoryServer.sh -Port="$SERVERGAMEPORT"
