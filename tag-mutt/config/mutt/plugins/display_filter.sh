#!/usr/bin/env sh

# message=$(recode utf-8..iso-8859-1 | recode HTML_4.0)
message=$(tee /tmp/mutt.txt)

if echo "${message}" | egrep --silent "From: Trello"; then
  echo "${message}" | trelloparse
else
  echo "${message}"
fi
