# If we aren't in a git directory, I probably wanted ls
gs() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    git status -sb $@
  else
    echo "This isn't a git repo. I'm going to assume you meant ls"
    ls $@
  fi
}
