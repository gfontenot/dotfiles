# Ensure we're always in a tmux session
ensure_we_are_inside_tmux() {
  if _not_in_tmux; then
    _ensure_tmux_is_running
    tmux attach -t "$(_most_recent_tmux_session)"
  fi
}

# Returns the name of the most recent tmux session, sorted by time the session
# was last attached.
_most_recent_tmux_session(){
  tmux list-sessions -F "#{session_last_attached} #{session_name}" | \
    sort -r | \
    cut -d' ' -f2 | \
    head -1
}

_not_in_tmux() {
  [[ -z "$TMUX" ]]
}

_no_tmux_sessions() {
  [[ -z $(tmux ls) ]]
}

_ensure_tmux_is_running() {
  if _no_tmux_sessions; then
    # create our default session with mutt and our dotfiles
    local session_name="personal"
    tmux new-session -s "$session_name" -d mutt
    tmux new-window -t "$session_name" -d -c "$DOTFILES"
  fi
}

ensure_we_are_inside_tmux
