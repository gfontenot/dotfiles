# Open the current directory with Xcode and let it do its thang
xopen() {
  if [[ "$2" == "" ]]; then
    open -a "$1" .
  else
    open -a "$1" "$2"
  fi
}

x() {
  xopen "$(xcode-current)" "$@"
}

x-pre() {
  xopen "Xcode-beta" "$@"
}

play() {
  x "$HOME/.scratchpad.playground"
}

play-pre() {
  x-pre "$HOME/.scratchpad.playground"
}
