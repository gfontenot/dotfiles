autoload -U colors && colors

export PROMPT=$'%{\e[0;%(?.32.31)m%}❯%{$reset_color%} '

export RPROMPT=$'%c $(git_info)$(ruby_version)'

git_info() {
  if [ "$(git_dir)" ]; then
    echo "$(current_branch) $(current_sha)$(rebase_info) $(repo_dirty)$(needs_push)"
  fi
}

ruby_version() {
  echo "$(rbenv version-name)"
}

current_branch() {
  if [ "$(current_branch_name)" ]; then
    echo "%{$fg[blue]%}$(current_branch_name)%{$reset_color%}"
  else
    echo "%{$fg[red]%}DETACHED%{$reset_color%}"
  fi
}

current_sha() {
  echo "%{$fg[yellow]%}$(git rev-parse --short HEAD)%{$reset_color%}"
}

rebase_info() {
  if [ -f "$(git_dir)/BISECT_LOG" ]; then
    echo "+bisect"
  elif [ -f "$(git_dir)/MERGE_HEAD" ]; then
    echo "+merge"
  else
    for file in 'rebase' 'rebase-apply' 'rebase-merge'; do
      if [ -f "$(git_dir)/$file" ]; then
        echo "+rebase"
        continue
      fi
    done
  fi
}

repo_dirty() {
  if [[ ! $(git status 2>/dev/null) =~ "directory clean" ]]; then
    echo "%{$fg[red]%}✗%{$reset_color%} "
  fi
}

needs_push() {
  if [ "$(git cherry -v origin/$(current_branch_name) 2>/dev/null)" ]; then
    echo "%{$fg[red]%}⬆%{$reset_color%}  "
  fi
}

current_branch_name() {
  git rev-parse --abbrev-ref HEAD
}

git_dir() {
  git rev-parse --git-dir 2>/dev/null
}
