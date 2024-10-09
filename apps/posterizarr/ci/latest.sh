#!/usr/bin/env bash

_REPO=posterizarr
_REPO_OWNER=fscorrupt

version=$(curl -sX GET "https://api.github.com/repos/${_REPO_OWNER}/${_REPO}/releases/latest" | jq --raw-output '.tag_name')
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
