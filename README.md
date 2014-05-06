Dotfiles
========

This repo uses [rcm] for management. It's pretty neat, you should check it
out.

[rcm]: https://github.com/thoughtbot/rcm

It also heavily uses the tag feature of rcm. It's really just for
organizational purposes, but it also means that you _could_ do neat things
like just pull down parts of my dotfiles if you'd like:

```
git clone git@github.com:gfontenot/dotfiles.git .gfontenot-dotfiles
rcup -d .gfontenot-dotfiles -x README.md -x rcrc -t git
```

I settled on a pattern for my dotfiles that I'm pretty happy with. It's a
modification of the pattern [holman] uses, which is where I forked my dotfiles
from originally years ago.

[holman]: https://github.com/holman/dotfiles

Files and directories located in the root of a tag will be symlinked into
place by rcm as expected. However, many tags also have a `source` directory,
which is explicitly ignored by the [`rcrc`][rcrc]. This directory holds files
that are critical to the operation of my dotfiles, but shouldn't be symlinked
out of this directory. Most of the time, these files are extensions to my zsh
configuration, and end in `zsh`. I feel that breaking out my aliases and other
specific configurations into smaller files helps me keep a better mental model
of how my dotfiles are structured. My zhrc will source all files ending in
`zsh` located in these `source` directories, with the exception of any
`completion.zsh` files, which are explicitly sourced last.

[rcrc]: https://github.com/gfontenot/dotfiles/blob/master/rcrc
