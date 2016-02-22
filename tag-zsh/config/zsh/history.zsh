HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt INC_APPEND_HISTORY # adds history incrementally
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
