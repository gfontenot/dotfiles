# Delete local and remote branch
gbd() { git push origin :$1 && git branch -d $1 ; }
