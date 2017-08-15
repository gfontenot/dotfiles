source "$HOME/.config/zsh/path.zsh"

# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/Code"

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$PROJECTS/dotfiles"

# Your personal Dropbox folder
export DROPBOX="$HOME/Dropbox (Personal)"

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

autoload zmv

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt EXTENDED_GLOB

# set the editor du jour.
export VISUAL='/usr/local/bin/nvim'
export EDITOR="$VISUAL"

# I have _no idea_ how I broke this, but for some reason, this was bound to
# `redisplay`, which is _clearly_ wrong, so this is me chaning it back.
bindkey "^R" history-incremental-search-backward

source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/completion.zsh"
source "$HOME/.config/zsh/history.zsh"
source "$HOME/.config/zsh/navigation.zsh"
source "$HOME/.config/zsh/prompt.zsh"

# fzf {{{
# Use `ag` as the default command and filter out ignored files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

export FZF_DEFAULT_OPTS='
--bind ctrl-u:page-up,ctrl-f:page-down
'
# }}}

# ssh {{{
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
# }}}

# asdf {{{
source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"
# }}}

# chruby {{{
source "/usr/local/share/chruby/chruby.sh"
source "/usr/local/share/chruby/auto.sh"

chruby "ruby-2.2.2"
# }}}

# swiftenv {{{
eval "$(swiftenv init -)"
# }}}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Ensure we're in a tmux session at launch
tmux-create-or-attach
