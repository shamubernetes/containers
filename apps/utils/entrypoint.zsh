#!/usr/bin/env zsh

builtin emulate -LR zsh ${=${options[xtrace]:#off}:+-o xtrace}
builtin setopt warn_create_global typeset_silent no_short_loops rc_quotes no_auto_pushd extended_glob no_monitor pipefail

0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

export LOG_LEVEL=1

source ${0:h}/lib/init.zsh "$@"
