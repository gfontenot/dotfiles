source "$HOME/.config/zsh/path.zsh"

# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/Code"

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$PROJECTS/dotfiles"

# Your personal Dropbox folder
export DROPBOX="$HOME/Dropbox (Personal)"

# source the base zshrc configurations first
for config_file (~/.config/zsh/*.zsh) source $config_file

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# source the remaining zsh config files
for config_file (~/.config/^zsh/*.zsh) source $config_file

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Ensure we're in a tmux session at launch
tmux-create-or-attach
