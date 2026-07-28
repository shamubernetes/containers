#!/usr/bin/env bash
set -euo pipefail

channel=${1:?channel is required}
update_url="${WHISPARR_UPDATE_URL:-https://whisparr.servarr.com/v1/update/${channel}/changes?os=linuxmusl&runtime=netcore}"

version=$(
  curl --fail --silent --show-error --location \
    --retry 5 --retry-delay 2 --retry-all-errors \
    "${update_url}" \
    | jq --exit-status --raw-output \
      '.[0].version | select(type == "string" and length > 0)'
)
version="${version#*v}"
version="${version#*release-}"

if [[ -z "${version}" ]]; then
  echo "Whisparr ${channel} update response did not contain a version" >&2
  exit 1
fi

printf "%s" "${version}"
