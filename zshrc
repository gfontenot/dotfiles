# ============================================================================
# Path {{{
# ============================================================================

path=(
  "./.git/safe/../../bin"
  "./.git/safe/../../bin/stubs"
  "$HOME/.local/bin"
  "$HOME/.stack/bin"
  "$HOME/.asdf/bin"
  "$HOME/.asdf/shims"
  "/usr/local/bin"
  "$HOME/Library/Android/sdk/platform-tools"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
)

# }}}

# ============================================================================
# Options {{{
# ============================================================================

# Try to correct misspelled commands
setopt CORRECT
# Require exit or logout to exit a shell
setopt IGNORE_EOF
# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename
# generation
setopt EXTENDED_GLOB

# }}}

# ============================================================================
# Functions {{{
# ============================================================================

# Built in version of mv that can handle patterns
autoload zmv

# Create a directory and then cd into it
mcd() {
  mkdir -p "$@" && cd "$@" || exit 1
}

# }}}

# ============================================================================
# Editor {{{
# ============================================================================

export VISUAL='/usr/local/bin/nvim'
export EDITOR="$VISUAL"

# }}}

# ============================================================================
# Keybindings {{{
# ============================================================================

# I have _no idea_ how I broke this, but for some reason, this was bound to
# `redisplay`, which is _clearly_ wrong, so this is me changing it back.
bindkey "^R" history-incremental-search-backward

# }}}

# ============================================================================
# Aliases {{{
# ============================================================================

# ======
# GLOBAL
# ======

# All of a sudden, everything is hilarious
alias -g poop=pop
# fucking seriously
alias -g 0a=-a

# ===
# ZSH
# ===

alias reload!='. ~/.zshrc'
alias :q='logout'

# =======
# UTILITY
# =======

# Search for a process and kill it but in a funny way
# `fucking phoenix`
alias fucking="pkill -9 -f"
# Mark a git repo as being safe
alias mksafe="mkdir .git/safe"

# ===
# GIT
# ===

alias g=git

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

# ======
# EDITOR
# ======

alias e='$VISUAL'

# =====
# XCODE
# =====

# Clear the derived data folder cause uuuuuuggggghhhhhhh
alias fuxcode='rm -rf ~/Library/Developer/Xcode/DerivedData/'


# =====
# TOOLS
# =====

# Automatically install binstubs with bundler

b(){
  if [[ $# == 0 ]]; then
    (bundle check > /dev/null || bundle install) && \
      bundle --quiet --binstubs=./bin/stubs
  else
    bundle "$@"
  fi
}

# }}}

# ============================================================================
# Completion {{{
# ============================================================================

fpath=(~/.config/zsh/completion-scripts $fpath)

# don't expand aliases before completion has finished
# like: git comm-[tab]
setopt complete_aliases

autoload -U compinit
autoload -U bashcompinit
compinit
bashcompinit

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}

# ===
# GIT
# ===

compdef g=git

compdef _git gco=git-branch
compdef _git gp=git-push
compdef _git gmf=git-merge

compdef _git gbd=git-branch
_git-delete-branch() { compadd "$@" $(git branch) }

# }}}

# ============================================================================
# History {{{
# ============================================================================

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

# share history between sessions ???
setopt SHARE_HISTORY
# add timestamps to history
setopt EXTENDED_HISTORY
# adds history incrementally
setopt INC_APPEND_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# }}}

# ============================================================================
# Navigation {{{
# ============================================================================

setopt auto_cd
cdpath=($HOME $PROJECTS $PROJECTS/gfontenot $PROJECTS/Square $PROJECTS/Square/Cash $HOME/Dropbox)

# Exporting CDPATH is bad and can cause all sorts of problems so lets set
# CDPATH to something else and export that instead
export JUMP_DIRECTORIES=$CDPATH

# Configure Terminal to open new tabs in the current directory
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

# Function to perform when we change directories
function chpwd() {
    emulate -LR zsh

    # Auto-generate projections files on cd
    local v=$(projections)
    if [[ $? -eq 0 ]]; then
      echo $v > .projections.json
    fi

    # Auto ls when cding into a directory
    ls
}

# }}}

# ============================================================================
# Appearance {{{
# ============================================================================

# Use colors for CLI commands (like ls)
export CLICOLOR=true

# ======
# PROMPT
# ======

autoload -U colors && colors
setopt prompt_subst

export PROMPT='%(?.%F{green}.%F{red})❯%f '
export RPROMPT=$'%c $(prompt_git_info)'

prompt_git_info() {
  if prompt_git_dir &>/dev/null; then
    echo "$(prompt_current_branch)$(prompt_rebase_info)$(prompt_repo_dirty)$(prompt_needs_push)$(prompt_current_sha)"
  fi
}

prompt_current_branch() {
  local branch_name="$(prompt_current_branch_name)"

  if [ "$branch_name" = "HEAD" ]; then
    echo "%{$fg[red]%}DETACHED%{$reset_color%}"
  else
    echo "%{$fg[blue]%}$branch_name%{$reset_color%}"
  fi
}

prompt_current_sha() {
  echo " %{$fg[yellow]%}$(git rev-parse --short HEAD)%{$reset_color%}"
}

prompt_rebase_info() {
  local git_dir="$(prompt_git_dir)"

  if [ -f "$git_dir/BISECT_LOG" ]; then
    echo "+bisect"
  elif [ -f "$git_dir/MERGE_HEAD" ]; then
    echo "+merge"
  else
    for file in rebase rebase-apply rebase-merge; do
      if [ -e "$git_dir/$file" ]; then
        echo "+rebase"
        break
      fi
    done
  fi
}

prompt_repo_dirty() {
  if [[ ! $(git status 2>/dev/null) =~ "working tree clean" ]]; then
    echo " %{$fg[red]%}✗%{$reset_color%}"
  fi
}

prompt_needs_push() {
  if [[ -n "$(git cherry -v origin/$(prompt_current_branch_name) 2>/dev/null)" ]]; then
    echo " %{$fg[red]%}⬆%{$reset_color%} "
  fi
}

prompt_current_branch_name() {
  git rev-parse --abbrev-ref HEAD
}

prompt_git_dir() {
  git rev-parse --git-dir 2>/dev/null
}

# }}}

# ============================================================================
# FZF {{{
# ============================================================================

# Use `ag` as the default command and filter out ignored files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

export FZF_DEFAULT_OPTS='
--bind ctrl-u:page-up,ctrl-f:page-down
'

# }}}

# ============================================================================
# SSH {{{
# ============================================================================

export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

# }}}

# ============================================================================
# Language Tooling {{{
# ============================================================================

# =====
# ASDF
# =====

source "$HOME/.asdf/completions/asdf.bash"

# ========
# SWIFTENV
# ========

eval "$(swiftenv init -)"

# }}}

# Private config that shouldn't be shared
if [ -f "$HOME/.config/zsh/private.zsh" ]; then
  source "$HOME/.config/zsh/private.zsh"
fi

# Ensure we're in a tmux session at launch
tmux-create-or-attach
