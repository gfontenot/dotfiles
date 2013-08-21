import re, subprocess

GMAIL_FOLDER_MAP = {
    "drafts": "[Gmail]/Drafts",
    "sent":    "[Gmail]/Sent Mail",
    "flagged": "[Gmail]/Starred",
    "trash":   "[Gmail]/Trash",
    "archive": "[Gmail]/All Mail"
}

FASTMAIL_FOLDER_MAP = {
    "drafts": "INBOX.Drafts",
    "sent": "INBOX.Sent Items",
    "trash": "INBOX.Trash",
    "archive": "INBOX.Archive"
}

INVERSE_GMAIL_FOLDER_MAP = {v:k for k,v in GMAIL_FOLDER_MAP.items()}
INVERSE_FASTMAIL_FOLDER_MAP = {v:k for k,v in FASTMAIL_FOLDER_MAP.items()}

EXCLUDED_FOLDERS = ["[Gmail]/Trash", "[Gmail]/Important", "[Gmail]/Spam", "INBOX.Trash", "INBOX.Junk Mail"]

def local_folder_to_gmail_folder(folder):
    return GMAIL_FOLDER_MAP.get(folder, folder)

def gmail_folder_to_local_folder(folder):
    return INVERSE_GMAIL_FOLDER_MAP.get(folder, folder)

def local_folder_to_fastmail_folder(folder):
    return FASTMAIL_FOLDER_MAP.get(folder, folder)

def fastmail_folder_to_local_folder(folder):
    return INVERSE_FASTMAIL_FOLDER_MAP.get(folder, folder)

def should_include_folder(folder):
    return folder not in EXCLUDED_FOLDERS

def get_password(account):
  cmd = "~/Code/dotfiles/bin/keychain.py %s" % account
  return subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT).rstrip()
