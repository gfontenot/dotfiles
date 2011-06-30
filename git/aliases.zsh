# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/

alias git=hub

# Quick alias to show files that have been deleted

alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
