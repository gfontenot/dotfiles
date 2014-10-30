export GPG_TTY=`tty`

eval $(gpg-agent --daemon --enable-ssh-support \
  --write-env-file "${HOME}/.gpg-agent-info")

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi
