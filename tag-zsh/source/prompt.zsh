autoload -U colors && colors
prompt_opts=( cr subst percent )

export PROMPT='%(?.%F{green}.%F{red})❯%f '
export RPROMPT=$'$(swift_version)%c $(git_info)'

git_info() {
  if git_dir &>/dev/null; then
    echo "$(current_branch)$(rebase_info)$(repo_dirty)$(needs_push)$(current_sha)"
  fi
}

swift_version() {
  if /usr/bin/xcode-select -p | grep -i beta &>/dev/null; then
    echo "%{$fg[yellow]%}BETA%{$reset_color%} "
  fi
}

current_branch() {
  local branch_name="$(current_branch_name)"

  if [ "$branch_name" = "HEAD" ]; then
    echo "%{$fg[red]%}DETACHED%{$reset_color%}"
  else
    echo "%{$fg[blue]%}$branch_name%{$reset_color%}"
  fi
}

current_sha() {
  echo " %{$fg[yellow]%}$(git rev-parse --short HEAD)%{$reset_color%}"
}

rebase_info() {
  local git_dir="$(git_dir)"

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

repo_dirty() {
  if [[ ! $(git status 2>/dev/null) =~ "directory clean" ]]; then
    echo " %{$fg[red]%}✗%{$reset_color%}"
  fi
}

needs_push() {
  if [[ -n "$(git cherry -v origin/$(current_branch_name) 2>/dev/null)" ]]; then
    echo " %{$fg[red]%}⬆%{$reset_color%} "
  fi
}

current_branch_name() {
  git rev-parse --abbrev-ref HEAD
}

git_dir() {
  git rev-parse --git-dir 2>/dev/null
}
