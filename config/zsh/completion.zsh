fpath=(~/.config/zsh/completion-scripts ~/.config/zsh/functions $fpath)

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

autoload -U compinit
compinit

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}

compdef g=git

compdef _git gco=git-checkout
compdef _git gp=git-push
compdef _git gmf=git-merge

compdef _git gbd=git-branch
_git-delete-branch() { compadd "$@" $(git branch) }
