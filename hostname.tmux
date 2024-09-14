#!/usr/bin/env bash

HOSTNAME_TMUX_ROOT_ICON=${HOSTNAME_TMUX_ROOT_ICON:-󰏅}
HOSTNAME_TMUX_SSH_ICON=${HOSTNAME_TMUX_SSH_ICON:-}

hostname_tmux_is_ssh() {
  printenv | grep SSH_CLIENT >/dev/null
}

hostname_tmux() {
  local HOSTNAME_TMUX

  if [ $USERNAME == "root" ]; then
    HOSTNAME_TMUX+="${HOSTNAME_TMUX_ROOT_ICON} root@"
  fi

  if hostname_tmux_is_ssh; then
    HOSTNAME_TMUX+="${USER}@$(hostname)"
  else
    HOSTNAME_TMUX+="$(hostname)"
  fi

  if hostname_tmux_is_ssh; then
    HOSTNAME_TMUX+=" ${HOSTNAME_TMUX_SSH_ICON} "
  fi

  echo "${HOSTNAME_TMUX}"
}

hostname_tmux "$@"
