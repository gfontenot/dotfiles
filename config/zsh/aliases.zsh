alias dotedit='cd $DOTFILES && e'

alias curl='noglob curl'

alias reload!='. ~/.zshrc'

# All of a sudden, everything is hilarious
alias -g poop=pop

# fucking seriously
alias -g 0a=-a

alias :q='logout'

# Search for a process and kill it but in a funny way
# `fucking phoenix`
alias fucking="pkill -9 -f"

# Mark a git repo as being safe
alias mksafe="mkdir .git/safe"

# Use `hub` as our git wrapper:
#   https://github.com/github/hub
alias g=hub

# alias straight to difftool for quick access
alias gdiff='g diff'

# quick aliases for common actions
alias ga='g add'
alias gc!='g c'
alias gcm='g cm'
alias gco='g co'
alias gp='g push'
alias gmf='g merge --ff-only'
alias gup='g up'
alias gsup='g sup'

alias gbc='g create-branch'
alias gbd='g delete-branch'

# log aliases
alias gl='g l'
alias glb='g lb'

alias e='$VISUAL'
alias s='e ~/.scratch.md'

alias mutt='echo -n -e "\033]0;mutt\007" && cd ~/Desktop && mutt'

# Clear the derived data folder cause uuuuuuggggghhhhhhh
alias fuxcode='rm -rf ~/Library/Developer/Xcode/DerivedData/'
