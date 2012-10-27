# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
alias g=hub

# alias straight to difftool for quick access
alias gdiff='git difftool -y'

# quick aliases for common actions
alias gs='git status -sb'
alias ga='git add'
alias gc!='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gp='git push'
alias gmf='git merge --ff-only'
alias gup='git smart-pull'


# log aliases
alias glog='git log --pretty="format:%C(yellow)%h%Cblue%d%Creset %s - %C(white)%an %Cgreen(%cr)%Creset" --date=relative'
alias gl='glog --graph'
alias gla='gl --all'

# git rm deleted files
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
