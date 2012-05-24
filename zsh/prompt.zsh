project_pwd() {
  echo $PWD | sed -e "s/\/Users\/$USER/~/" -e "s/~\/Dropbox\/Personal\/!!Code\/\([^\/]*\)/\\1/"
}

ruby_version() {
  echo " $(ruby -v | awk '{print $2}')"
}

export PROMPT=$'%{\e[0;90m%}%n@%m%{\e[0m%}
%{\e[0;%(?.32.31)m%}>%{\e[0m%} '

export RPROMPT=$'$(project_pwd)$($ZSH/zsh/git_cwd_info)'