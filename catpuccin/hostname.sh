show_hostname() {
  local index icon color text root_icon ssh_icon

  add_tmux_batch_option "@catppuccin_hostname_icon"
  add_tmux_batch_option "@catppuccin_hostname_root_icon"
  add_tmux_batch_option "@catppuccin_hostname_ssh_icon"

  run_tmux_batch_commands

  index=$1
  icon="$(get_tmux_option "@catppuccin_hostname_icon" "󰍹")"
  color="$(get_tmux_option "@catppuccin_hostname_color" "$thm_magenta")"
  root_icon=$(get_tmux_batch_option "@catppuccin_hostname_root_icon" "󰏅")
  ssh_icon=$(get_tmux_batch_option "@catppuccin_hostname_ssh_icon" "")
  text="$(get_tmux_option "@catppuccin_hostname_text" "#(HOSTNAME_TMUX_ROOT_ICON=$root_icon HOSTNAME_TMUX_SSH_ICON=$ssh_icon \${TMUX_PLUGIN_MANAGER_PATH}/hostname-tmux/hostname.tmux)")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
