zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}

compdef g=git

compdef _git gco=git-checkout
compdef _git gp=git-push
compdef _git gmf=git-merge

compdef _git gbd=git-branch
_git-delete-branch() { compadd "$@" $(git branch) }
