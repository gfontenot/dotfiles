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
  "/usr/local/sbin"
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
alias :q='exit'

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
alias gdiff='git diff'

# quick aliases for common actions
alias ga='git add'
alias gc!='git c'
alias gcm='git cm'
alias gco='git co'
alias gp='git push'
alias gmf='git merge --ff-only'
alias gup='git up'
alias gsup='git sup'
alias gbc='git create-branch'
alias gbd='git delete-branch'

# log aliases
alias gl='git l'
alias glb='git lb'

# ======
# EDITOR
# ======

# Open the current directory if we didn't specify a file to open

e() {
  if [[ -z "$@" ]]; then
    nvim .
  else
    nvim "$@"
  fi
}


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

# Add custom completion for git-delete-branch based on branch names
_git_delete_branch() {
  __gitcomp_nl "$(__git_heads)"
}

autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

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
cdpath=($HOME $PROJECTS $PROJECTS/gfontenot $PROJECTS/Square/Cash)

# Configure Terminal to open new tabs in the current directory
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

# Function to perform when we change directories
function chpwd() {
    emulate -LR zsh

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
  echo " %{$fg[yellow]%}$(git rev-parse --short HEAD 2>/dev/null)%{$reset_color%}"
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
  git rev-parse --abbrev-ref HEAD 2>/dev/null
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
# Misc {{{
# ============================================================================

# Private config that shouldn't be shared
if [ -f "$HOME/.config/zsh/private.zsh" ]; then
  source "$HOME/.config/zsh/private.zsh"
fi

# Ensure we're in a tmux session at launch
tmux-create-or-attach
