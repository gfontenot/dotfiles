export GPG_TTY=`tty`

# Note that this requires gpg-agent to be running. This is controlled by a
# launch agent script.
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi
