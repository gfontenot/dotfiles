#!/usr/bin/ruby
 
# logtodayone.rb
# Brett Terpstra (http://brettterpstra.com)
# Use and modify freely, attribution appreciated
# 
# This script works with the Day One[1] command line utility
# It parses an input string for an exclamation point prefix to mark starred
# and/or a [date string] at the beginning to parse natural language dates
# 
# Requirements:
# Chronic ruby gem
#
# Example usage:
# logtodayone.rb "! This is a starred entry."
# logtodayone.rb "[yesterday 3pm] Something I did yesterday at 3:00PM"
# logtodayone.rb "! [-2 1:30am] A starred entry about something I did two days ago"
 
require 'rubygems'
require 'chronic' # (`gem install chronic`)
 
if ARGV.length > 0
  input = ARGV.join(" ").strip
else
  print "Log entry: "
  input = gets.strip
end
 
# If the input starts with an exclamation point, make it starred
starred = input =~ /^!/ ? "true" : "false"
# remove the bang from the input string
input = input.gsub(/^!\s*/,'')
 
# if there's a [date] specified, parse it
if input =~ /^\[(.*?)\]/
  datestring = $1
  # if the date starts with -X, assume it means X days ago
  if datestring =~ /^\-(\d+)/
    datestring.sub!(/\-(\d+)/,"\\1 days ago ")
  end
  # Replace a single 'y' within the date brackets with "Yesterday" for parsing
  datestring.sub!(/\by\b/,'yesterday')
  # Parse the resulting date string with Chronic
  d = Chronic.parse(datestring, {:context => :past, :ambiguous_time_range => 8})
  d = DateTime.now if d.nil?
else
  # if no [date] specified, make it right now
  d = DateTime.now
end
date = d.strftime("%m/%d/%Y %l:%M%p") # dayone formatted
input = input.gsub(/^\[.*?\]\s*/,'') # remove [date] from input
 
%x{echo "#{input}"|/usr/local/bin/dayone -d="#{date}" -s=#{starred} new}