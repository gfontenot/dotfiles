# Set prefix to C-s
set -g prefix C-s
unbind C-s
bind C-s send-prefix

# Open a temporary split with gitsh
bind g split-window -h -c '#{pane_current_path}' -l 83 'reattach-to-user-namespace gitsh'

# reload config
unbind r
bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

# jump between sessions
unbind p
bind-key p split-window -v -l 20 "tmux-fuzzy-choose-tree"

# copy/paste
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
