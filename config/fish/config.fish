# ============================================================================
# Path {{{
# ============================================================================

fish_add_path $HOME/Library/Android/sdk/platform-tools
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin
fish_add_path $HOME/stack/bin
fish_add_path $HOME/.local/bin
set PATH ./.git/safe/../../bin ./.git/safe/../../bin/stubs $PATH
set -x ASDF_DATA_DIR $HOME/.asdf
set PATH $ASDF_DATA_DIR/shims $PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

set -x XDG_CONFIG_HOME "$HOME/.config"

# Where I keep my projects
set -x PROJECTS "$HOME/Development"

# Shortcut to my dotfiles directory
set -x DOTFILES "$PROJECTS/dotfiles"

# }}}

function __ls_projects
    fd .git $PROJECTS --glob --type=d --prune --hidden --format="{//}"
end

alias pcd "cd (__ls_projects | fzf)"

# ============================================================================
# Editor {{{
# ============================================================================

set -x VISUAL nvim
set -x EDITOR $VISUAL

alias e nvim

# }}}

# ============================================================================
# Git {{{
# ============================================================================

# Mark a git repo as being safe
alias mksafe "mkdir .git/safe"

alias g git
alias lg lazygit

# quick aliases for common actions
alias gdiff 'git diff'
alias ga 'git add'
alias gc! 'git c'
alias gco 'git co'
alias gp 'git push'
alias gup 'git up'
alias gbc 'git create-branch'
alias gbd 'git delete-branch'

# log aliases
alias gl 'git l'
alias glb 'git lb'

# }}}

# ============================================================================
# Misc {{{
# ============================================================================

# Disable welcome messages
set fish_greeting

# Clear the derived data folder cause uuuuuuggggghhhhhhh
alias fuxcode 'rm -rf ~/Library/Developer/Xcode/DerivedData/'

# Use eza instead of ls
alias ls 'eza --icons=always'

# show directory listing on directory change
# stolen from fishingline/cd-ls
# https://github.com/fishingline/cd-ls/blob/main/conf.d/cd-ls.fish
function __ls_after_cd__on_variable_pwd --on-variable PWD
    if status is-interactive
        ls
    end
end

# }}}

# ============================================================================
# FZF {{{
# ============================================================================

fzf --fish | source

# Make Alt-C work on macOS
bind -M insert "ç" fzf-cd-widget

set -x FZF_DEFAULT_OPTS '
--bind ctrl-u:page-up,ctrl-f:page-down
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

# Use fd and eza (with previews) instead of find and ls

set eza_preview "eza --tree --color=always {} | head -200"
set bat_preview "bat -n --color=always --line-range :500 {}"
set show_file_or_dir_preview "if test -d {} ; $eza_preview; else; $bat_preview; end"

set -x FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_CTRL_T_OPTS "--preview '$show_file_or_dir_preview'"
set -x FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"
set -x FZF_ALT_C_OPTS "--preview '$eza_preview'"

# }}}

# ============================================================================
# JAVA {{{
# ============================================================================

set -x JAVA_HOME $(set -e JAVA_HOME; /usr/libexec/java_home -v 17)
set PATH $PATH $JAVA_HOME

# }}}

# ============================================================================
# Prompt {{{
# ============================================================================

starship init fish | source

# }}}
