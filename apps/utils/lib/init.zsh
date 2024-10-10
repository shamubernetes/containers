#!/usr/bin/env zsh

if [[ -z $1 ]]; then
  echo "[ERROR] No function provided"
  return 1
fi

0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# autoload functions
for f in $0:h/../functions/*; do
  autoload -Uz "${f}"
done

+log:info "Functions loaded"

local __FUNCTION="${1}"
shift

local REPLY
util:getalias "${__FUNCTION}"
REPLY="${REPLY:-${__FUNCTION}}"

+log:info "Running ${REPLY}"

exec "${REPLY}" "$@"
