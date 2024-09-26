#!/usr/bin/env bash
channel=$1

if [ -z "${channel}" ]; then
  echo "Usage: $0 <channel>"
  exit 1
fi

app_id=1690800

json=$(curl -s https://api.steamcmd.net/v1/info/${app_id})
version=$(echo ${json} | jq -r ".data.\"${app_id}\".depots.branches.\"${channel}\".buildid")

version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
