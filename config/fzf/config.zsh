# Use `ag` as the default command and filter out ignored files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

export FZF_DEFAULT_OPTS='
--bind ctrl-u:page-up,ctrl-f:page-down
'
