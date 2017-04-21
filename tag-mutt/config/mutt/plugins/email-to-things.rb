#!/usr/bin/env ruby

header = {}
lines = STDIN.read.split("\n")

lines.each do |line|
  break if line.empty?
  key = line.split(':')[0]
  value = line.gsub("#{key}: ", "")
  header[key] = value
end

body = lines[header.keys.count + 1..-1].join("\n")

title = "Email: #{header['Subject']}"
note =<<-EOM
From: #{header['From']}
Date: #{header['Date']}
Subject: #{header['Subject']}
Message Body:

#{body}
EOM

applescript = <<-APPLESCRIPT
tell application "Things.app"
  make new to do with properties {name:"#{title.gsub('"', "'")}", notes:"#{note.gsub('"', "'")}"}
end tell
APPLESCRIPT

shell = IO.popen('osascript', 'w')
shell.write applescript
shell.close
