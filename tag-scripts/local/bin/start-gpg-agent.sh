#!/usr/bin/env sh

/usr/local/bin/gpg-agent --daemon --write-env-file "${HOME}/.gpg-agent-info"
