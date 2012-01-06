#!/usr/bin/env python
# encoding: utf-8
# 
# clean_db.py
# 
# Created by Gordon Fontenot on 2010-06-03.
# 
# usage: python clean_db.py
# 
# Running this script will scrape your dropbox looking for conflicted copies. If it
# finds any, it will move them to a directory named '!Conflicted Copies' at the root
# of your dropbox.

import sys
import os
import re
from shutil import move

dropboxPath = "~/Dropbox"
dropboxPath = os.path.expanduser(dropboxPath)
conflictedPath = dropboxPath + "/!Conflicted Copies/"
p = re.compile("'s Conflicted Copy", re.IGNORECASE)
p_ignore = re.compile("!Conflicted Copies", re.IGNORECASE)

def main():
	if not os.path.exists(conflictedPath):
		os.mkdir(conflictedPath)
	for root, dirs, files in os.walk(dropboxPath):
		if not (p_ignore.search(root)):
			for name in files:
				if p.search(name):
#					print "Conflicted Copy Found!\n" + root + "\n" + name
					f = os.path.join(root, name)
					try:
						move(f, conflictedPath)
					except:
						print "Error moving "+ f

if __name__ == '__main__':
	main()

