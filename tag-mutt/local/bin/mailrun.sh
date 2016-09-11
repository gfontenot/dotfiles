#!/bin/bash

if pgrep -q mbsync; then
  echo "Another instance of mbsync is running. Killing it now."
  pkill mbsync
fi

mailboxes=$1

[ -z "$mailboxes" ] && mailboxes="-a"

/usr/local/bin/mbsync -q "$mailboxes"
/usr/local/bin/mu index --maildir=~/.mail
