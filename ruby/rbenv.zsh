# rehash shims
rbenv rehash 2>/dev/null

# path
export PATH="$HOME/.rbenv/bin:$PATH"

# completion + shims
eval "$(rbenv init -)"