#!/usr/bin/env bash
# if running on a linux, use grep
GREP_CMD="grep"

# if running on a mac, use ggrep
OS_TYPE=$(uname)
if [[ "${OS_TYPE}" == "Darwin" ]]; then
    GREP_CMD="ggrep"
fi

version=$(curl -sX GET "https://pkgs.alpinelinux.org/packages?name=postgresql16-client&branch=v3.19&arch" | ${GREP_CMD} -oP '(?<=<td class="version">)[^<]*' 2>/dev/null)
version="${version%%_*}"
version="${version%%-*}"
printf "%s" "${version}"
