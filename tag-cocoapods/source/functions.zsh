p() {
  if [ -n "$@" ]; then
    pod install
  else
    pod "$@"
  fi
}
