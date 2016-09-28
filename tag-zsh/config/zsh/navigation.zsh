setopt auto_cd
cdpath=($HOME $PROJECTS $PROJECTS/thoughtbot $PROJECTS/clients $PROJECTS/gfontenot $DROPBOX)

# Exporting CDPATH is bad and can cause all sorts of problems so lets set
# CDPATH to something else and export that instead
export JUMP_DIRECTORIES=$CDPATH
