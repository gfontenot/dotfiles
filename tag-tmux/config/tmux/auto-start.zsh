_is_tmux_not_running() {
  [[ -z "$TMUX" ]]
}

if _is_tmux_not_running; then
  tat
fi
