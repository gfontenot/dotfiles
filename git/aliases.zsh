# Use `gh` as our git wrapper:
#   https://github.com/jingweno/gh
alias g=gh
alias gitsh='gitsh --git gh'

# alias straight to difftool for quick access
alias gdiff='g diff'

# quick aliases for common actions
alias ga='g add'
alias gc!='g commit -v'
alias gcm='g commit -m'
alias gco='g checkout'
alias gp='g push'
alias gmf='g merge --ff-only'
alias gup='g update && g remote prune origin'
alias gsup='g submodule update --init --recursive'

# log aliases
alias gl='g log --format=custom --graph'

# git rm deleted files
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
