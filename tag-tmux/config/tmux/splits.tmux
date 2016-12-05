# horizontal and vertical splits
bind \ split-window -h -c '#{pane_current_path}'
bind - split-window -v -c '#{pane_current_path}'

# resize current pane with hjkl (repeatable)
unbind l
bind -r l resize-pane -R 8
unbind h
bind -r h resize-pane -L 8
unbind k
bind -r k resize-pane -U 4
unbind j
bind -r j resize-pane -D 4

# Smart pane switching with awareness of vim splits
forward_programs="view|n?vim?|fzf"

should_forward="ps -o state= -o comm= -t '#{pane_tty}' \
  | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?($forward_programs)(diff)?$'"

bind -n C-h if-shell "$should_forward" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$should_forward" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$should_forward" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$should_forward" "send-keys C-l" "select-pane -R"
bind -n C-\ if-shell "$should_forward" "send-keys C-\\" "select-pane -l"
