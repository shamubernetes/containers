#!/usr/bin/env bash
set -euo pipefail

# Track the runner version home-operations publishes; its image is the base.
version=$(
  curl --fail --silent --show-error --location \
    --retry 5 --retry-delay 2 --retry-all-errors \
    "${ACTIONS_RUNNER_RELEASE_URL:-https://api.github.com/repos/actions/runner/releases/latest}" |
    jq --exit-status --raw-output '.tag_name | select(type == "string" and length > 1)'
)
version="${version#v}"

if [[ ! ${version} =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "actions/runner release did not contain a version" >&2
  exit 1
fi

printf "%s" "${version}"
