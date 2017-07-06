export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=(~/.config/zsh/completion-scripts ~/.config/zsh/functions $fpath)

autoload -U ~/.config/zsh/functions/*(:t)
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

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# Configure Terminal to open new tabs in the current directory
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

# Auto ls when cding into a directory
function chpwd() {
    emulate -LR zsh

    local v=$(projections)
    if [[ $? -eq 0 ]]; then
      echo $v > .projections.json
    fi

    ls
}

# set the editor du jour.
export VISUAL='/usr/local/bin/nvim'
export EDITOR="$VISUAL"

# I have _no idea_ how I broke this, but for some reason, this was bound to
# `redisplay`, which is _clearly_ wrong, so this is me chaning it back.
bindkey "^R" history-incremental-search-backward
