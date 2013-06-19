# Delete local and remote branch
gbd() { git branch -D $1 && git push origin :$1; }
