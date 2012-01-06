# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
alias g=hub

# alias straight to difftool for quick access
alias gdiff='git difftool'

# quick aliases for common actions
alias gs='git status --short'
alias ga='git add'
alias gap='ga -p'
alias gau='ga -u'
alias gc!='git commit -v'
alias gcp='git commit -p'
alias gcav='git commit -a -v'
alias gco='git checkout'
alias gp='git push'
alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'
alias gup='git smart-pull'


# log aliases
alias glog='git log --pretty="format:%C(yellow)%h%Cblue%d%Creset %s - %C(white)%an %Cgreen(%cr)%Creset" --date=relative'
alias gl='glog --graph'
alias gla='gl --all'