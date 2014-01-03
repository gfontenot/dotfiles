#!/bin/bash

mbsyncInstances=`ps aux | grep mbsync | wc -l`

if [ $mbsyncInstances == 2 ]; then
  echo "Another instance of mbsync is running. Killing it now."
  killall mbsync
fi

/usr/local/bin/mbsync -q -a
