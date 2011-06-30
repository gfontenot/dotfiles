# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
 alias ls="gls -F --color"
 alias l="gls -lAh --color"
 alias ll="gls -l --color"
 alias la='gls -A --color'
fi

if [ "$(uname)" = "Linux" ]
then
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto'
    alias l='ls -lAh --color=auto'
    alias ll='ls -l --color=auto'
    alias la='ls -A --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  fi 
fi

mcd () {mkdir -p "$@" && cd "$@"; }