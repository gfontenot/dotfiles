#! /usr/bin/python
import sys
import re, subprocess

def get_password(account):
  command = "security find-generic-password -g -a %s -s email" % account
  output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
  outtext = [l for l in output.splitlines()
    if l.startswith('password: ')][0]
  return re.match(r'password: .*"(.*)"', outtext).group(1)

account = sys.argv[1]
print get_password(account)
