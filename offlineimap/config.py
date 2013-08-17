import re, subprocess

FOLDER_MAP = {
    "drafts": "[Gmail]/Drafts",
    "sent":    "[Gmail]/Sent Mail",
    "flagged": "[Gmail]/Starred",
    "trash":   "[Gmail]/Trash",
    "archive": "[Gmail]/All Mail"
}

INVERSE_FOLDER_MAP = {v:k for k,v in FOLDER_MAP.items()}

EXCLUDED_FOLDERS = ["[Gmail]/Trash", "[Gmail]/Important", "[Gmail]/Spam"]

def local_folder_to_gmail_folder(folder):
    return FOLDER_MAP.get(folder, folder)

def gmail_folder_to_local_folder(folder):
    return INVERSE_FOLDER_MAP.get(folder, folder)

def should_include_folder(folder):
    return folder not in EXCLUDED_FOLDERS

def get_password(account):
    command = "security find-generic-password -g -a %s -s offlineimap" % account
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
        if l.startswith('password: ')][0]
    return re.match(r'password: .*"(.*)"', outtext).group(1)
