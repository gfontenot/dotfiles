autoload -U colors && colors

project_pwd() {
  echo $PWD | sed -e "s/\/Users\/$USER/~/" -e "s/~\/Code\/\([^\/]*\)/\\1/"
}

ruby_version() {
  echo " $(rbenv version-name)"
}

export PROMPT=$'%{\e[0;%(?.32.31)m%}❯%{$reset_color%} '

export RPROMPT=$'%c$($ZSH/zsh/git_cwd_info)$(ruby_version)'
