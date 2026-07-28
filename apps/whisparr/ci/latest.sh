#!/usr/bin/env bash
set -euo pipefail

channel=${1:?channel is required}

if [[ ${channel} == "eros" ]]; then
  release_url="${WHISPARR_EROS_RELEASE_URL:-https://api.github.com/repos/Whisparr/Whisparr-Eros/releases/latest}"
  release=$(
    curl --fail --silent --show-error --location \
      --retry 5 --retry-delay 2 --retry-all-errors \
      "${release_url}"
  )
  version=$(
    jq --exit-status --raw-output \
      'select(.draft == false and .prerelease == false) |
       .tag_name | select(type == "string" and length > 1)' <<<"${release}"
  )
  version="${version#v}"
  asset="Whisparr.eros.${version}.linux-musl-x64.tar.gz"

  jq --exit-status --arg asset "${asset}" \
    '.assets | map(select(
      .name == $asset and
      (.browser_download_url | type == "string" and length > 0) and
      (.digest | type == "string" and test("^sha256:[0-9a-f]{64}$"))
    )) | length == 1' <<<"${release}" >/dev/null
else
  update_url="${WHISPARR_UPDATE_URL:-https://whisparr.servarr.com/v1/update/${channel}/changes?os=linuxmusl&runtime=netcore}"
  version=$(
    curl --fail --silent --show-error --location \
      --retry 5 --retry-delay 2 --retry-all-errors \
      "${update_url}" |
      jq --exit-status --raw-output \
        '.[0].version | select(type == "string" and length > 0)'
  )
  version="${version#*v}"
  version="${version#*release-}"
fi

if [[ -z ${version} || ! ${version} =~ ^[a-zA-Z0-9._-]+$ ]]; then
  echo "Whisparr ${channel} update response did not contain a version" >&2
  exit 1
fi

printf "%s" "${version}"
