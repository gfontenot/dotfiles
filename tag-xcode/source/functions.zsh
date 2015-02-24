xswitch() {
  if [[ "$1" == "beta" ]]; then
    sudo xcode-select -s /Applications/Xcode-Beta.app
  else
    sudo xcode-select -s /Applications/Xcode.app
  fi
}
