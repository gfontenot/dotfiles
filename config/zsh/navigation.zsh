setopt auto_cd
cdpath=($HOME $PROJECTS $PROJECTS/thoughtbot $PROJECTS/clients $PROJECTS/gfontenot $DROPBOX)

# Exporting CDPATH is bad and can cause all sorts of problems so lets set
# CDPATH to something else and export that instead
export JUMP_DIRECTORIES=$CDPATH

# Configure Terminal to open new tabs in the current directory
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

# Auto ls when cding into a directory
function chpwd() {
    emulate -LR zsh

    local v=$(projections)
    if [[ $? -eq 0 ]]; then
      echo $v > .projections.json
    fi

    ls
}
