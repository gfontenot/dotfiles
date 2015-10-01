# status bar
set -g status-bg black
set -g status-fg white
set -g status-interval 1
set -g status-right-length 60
set -g renumber-windows on
set -g base-index 1

set -g status-left ' '
set -g status-right '#(email-count -z -d " |") #(xcodebuild -version | grep "Xcode") '

set-window-option -g window-status-current-bg yellow
set-window-option -g window-status-current-fg black
