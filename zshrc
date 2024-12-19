# ============================================================================
# Path {{{
# ============================================================================

path=(
  "./.git/safe/../../bin"
  "./.git/safe/../../bin/stubs"
  "$HOME/.local/bin"
  "$HOME/.asdf/bin"
  "$HOME/.asdf/shims"
  "$HOME/.stack/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/Applications/Postgres.app/Contents/Versions/latest/bin"
  "$HOME/Library/Android/sdk/platform-tools"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
)

eval "$(/opt/homebrew/bin/brew shellenv)"

export XDG_CONFIG_HOME="$HOME/.config"

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

export VISUAL='nvim'
export EDITOR="$VISUAL"

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

alias e=nvim

# =====
# XCODE
# =====

# Clear the derived data folder cause uuuuuuggggghhhhhhh
alias fuxcode='rm -rf ~/Library/Developer/Xcode/DerivedData/'


# =====
# TOOLS
# =====

# Use eza instead of ls

alias ls='eza --icons=always'

# Automatically install binstubs with bundler

b(){
  if [[ $# == 0 ]]; then
    (bundle check > /dev/null || bundle install) && \
      bundle binstubs --all --path=./bin/stubs
  else
    bundle "$@"
  fi
}

# }}}

# ============================================================================
# Completion {{{
# ============================================================================

# fish-like autocomplete suggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^y' autosuggest-accept

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

eval "$(starship init zsh)"

# }}}

# ============================================================================
# FZF {{{
# ============================================================================

source <(fzf --zsh)

export FZF_DEFAULT_OPTS='
--bind ctrl-u:page-up,ctrl-f:page-down
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

# Use fd and eza (with previews) instead of find and ls

eza_preview="eza --tree --color=always {} | head -200"
bat_preview="bat -n --color=always --line-range :500 {}"
show_file_or_dir_preview="if [ -d {} ]; then $eza_preview; else $bat_preview; fi"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview '$eza_preview'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview "$eza_preview" "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Use fd to generate the list for path completion
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# }}}

# ============================================================================
# SSH {{{
# ============================================================================

export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

# }}}

# ============================================================================
# JAVA {{{
# ============================================================================

export JAVA_HOME=$(unset JAVA_HOME; /usr/libexec/java_home -v 17)
export PATH=$PATH:$JAVA_HOME

# }}}

# ============================================================================
# Misc {{{
# ============================================================================

# Private config that shouldn't be shared
if [ -f "$HOME/.config/zsh/private.zsh" ]; then
  source "$HOME/.config/zsh/private.zsh"
fi
