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
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe 'pbcopy'
