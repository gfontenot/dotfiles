# Set prefix to C-s
set -g prefix C-s
unbind C-s
bind C-s send-prefix

# Open a temporary split with gitsh
bind g split-window -h -c '#{pane_current_path}' -p 30 'gitsh'

# reload config
unbind r
bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

# copy/paste
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe 'pbcopy'
