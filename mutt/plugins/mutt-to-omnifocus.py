#!/usr/bin/env python

import sys
import os
import getopt
import email.parser

def usage():
    print """
    Take an RFC-compliant e-mail message on STDIN and add a
    corresponding task to the OmniFocus inbox for it.

    Options:
        -h, --help
            Display this help text.

        -q, --quick-entry
            Use the quick entry panel instead of directly creating a task.
    """

def applescript_escape(string):
    """Applescript requires backslashes and double quotes to be escaped in 
    string.  This returns the escaped string.
    """
    # Backslashes first (else you end up escaping your escapes)
    string = string.replace('\\', '\\\\')

    # Then double quotes
    string = string.replace('"', '\\"')

    return string

def parse_message(raw):
    """Parse a string containing an e-mail and produce a list containing the
    significant headers.  Each element is a tuple containing the name and 
    content of the header (list of tuples rather than dictionary to preserve
    order).
    """

    # Create a Message object
    message = email.parser.Parser().parsestr(raw, headersonly=True)

    # Extract relevant headers
    list = [("Date", message.get("Date")),
            ("From", message.get("From")),
            ("Subject", message.get("Subject")),
            ("Message-ID", message.get("Message-ID"))]

    return list

def send_to_omnifocus(params, quickentry=False):
    """Take the list of significant headers and create an OmniFocus inbox item
    from these.
    """

    # name and note of the task (escaped as per applescript_escape())
    name = "Mutt: %s" % applescript_escape(dict(params)["Subject"])
    note = "\n".join(["%s: %s" % (k, applescript_escape(v)) for (k, v) in params if v])

    # Write the Applescript
    if quickentry:
        applescript = """
            tell application "OmniFocus"
                tell default document
                    tell quick entry
                        open
                        make new inbox task with properties {name: "%s", note:"%s"}
                        select tree 1
                        set note expanded of tree 1 to true
                    end tell
                end tell
            end tell
        """ % (name, note)
    else:
        applescript = """
            tell application "OmniFocus"
                tell default document
                    make new inbox task with properties {name: "%s", note:"%s"}
                end tell
            end tell
        """ % (name, note)

    # Use osascript and a heredoc to run this Applescript
    os.system("\n".join(["osascript << EOT", applescript, "EOT"]))

def main():
    # Check for options
    try:
        opts, args = getopt.getopt(sys.argv[1:], "hq", ["help", "quick-entry"])
    except getopt.GetoptError:
        usage()
        sys.exit(-1)

    # If an option was specified, do the right thing
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit(0)
        elif opt in ("-q", "--quick-entry"):
            raw = sys.stdin.read()
            send_to_omnifocus(parse_message(raw), quickentry=True)
            sys.exit(0)

    # Otherwise fall back to standard operation
    raw = sys.stdin.read()
    send_to_omnifocus(parse_message(raw), quickentry=False)
    sys.exit(0)

if __name__ == "__main__":
    main()
