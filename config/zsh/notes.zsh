NOTES="$DROPBOX/notes"

new-note() {
  context="$1"
  if [ -z "$context" ]; then
    echo "context expected" >&2
    return 1
  fi

  datestamp=$(date +"%F")
  tempfile="$(mktemp -t note).md"
  $EDITOR "$tempfile"
  mkdir -p "$NOTES/$context"
  cat "$tempfile" >> "$NOTES/$context/$datestamp.md"
  echo >> "$NOTES/$context/$datestamp.md"
}

find-note() {
  pattern="$1"
  if [ -z "$pattern" ]; then
    echo "pattern expected" >&2
    return 1
  fi

  note=$(ag --nogroup "$pattern" "$NOTES" | sed "s|$NOTES/||" | fzf)
  note_file=$(echo "$note" | cut -d : -f 1)
  note_file_number=$(echo "$note" | cut -d : -f 2)
  $EDITOR "+$note_file_number" "$NOTES/$note_file"
}

edit-notes() {
  pushd "$NOTES" > /dev/null
  $EDITOR .
  popd > /dev/null
}

note() {
  case "$1" in
    ("new")
      new-note "${@:2}"
      ;;
    ("find")
      find-note "${@:2}"
      ;;
    ("edit")
      edit-notes
      ;;
    (*)
      echo "command expected" >&2
      return 1
      ;;
  esac
}

_new-note-completion() {
  completions="$(find "$NOTES" -mindepth 1 -type d | sed "s|$NOTES/||")"
  reply=("${(ps:\n:)completions}")
}

compctl -k '(find new edit)' \
  -x 'c[-1,find]' -k '()' \
  - 'c[-1,new]' -K _new-note-completion \
  -- note
