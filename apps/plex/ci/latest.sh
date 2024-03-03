#!/usr/bin/env bash
channel=$1

# if running on a linux, use grep
GREP_CMD="grep"

# if running on a mac, use ggrep
OS_TYPE=$(uname)
if [[ "${OS_TYPE}" == "Darwin" ]]; then
    GREP_CMD="ggrep"
fi

if [[ "${channel}" == "beta" ]]; then
    git clone --quiet --depth=1 https://aur.archlinux.org/plex-media-server-plexpass.git /tmp/plex-media-server-plexpass
    pushd /tmp/plex-media-server-plexpass > /dev/null || exit
    version="$(${GREP_CMD} -oP "(?<=pkgver=).*" PKGBUILD)"
    version="${version}-$(${GREP_CMD} -oP "(?<=_pkgsum=).*" PKGBUILD)"
    popd > /dev/null || exit
    rm -rf /tmp/plex-media-server-plexpass
fi

if [[ "${channel}" == "stable" ]]; then
    version=$(curl -sX GET 'https://plex.tv/api/downloads/5.json' | jq -r '.computer.Linux.version')
fi

version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
