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
tell application "OmniFocus"
  tell quick entry
    make new inbox task with properties {name:"#{title.gsub('"', "'")}", note:"#{note.gsub('"', "'")}"}
    open
  end tell

  tell application "System Events"
    keystroke tab
  end tell
end tell
APPLESCRIPT

`osascript << EOT
#{applescript}
#EOT`
