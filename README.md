# dotfiles #

## setup ##

After cloning this repo, running `setup/setup` will perform the entire setup
process. You can perform isolated parts of the setup process by running
individual scripts found in `setup` as well as the ones found in the `setup`
directories in specific tags.

## rcm ##

This repo uses [rcm] for management. It's pretty neat, you should check it
out.

[rcm]: https://github.com/thoughtbot/rcm

It also heavily uses the tag feature of rcm. It's really only for
organizational purposes, but it also means that you _could_ do neat things
like pull down parts of my dotfiles if you'd like:

```
git clone git@github.com:gfontenot/dotfiles.git .gfontenot-dotfiles
rcup -d .gfontenot-dotfiles -x README.md -x rcrc -t git
```

## repo organization ##

`rcm` will symlink all files into place, keeping the folder structure relative
to the tag root. However, there are some exceptions:

 - Anything under `tag-foo/source` will _not_ be symlinked. These files are
   usually additional configuration that doesn't need to be moved into the
   home directory, and are sourced in place. However, this might also include
   files such as `launchd` files or file templates.
 - Anything under `tag-foo/setup` will also not be symlinked into `$HOME`.
   These directories contain setup scripts for the specific tag.

These ignore patterns are being controlled by the `EXCLUDES` key in my
[`rcrc`][rcrc].

[rcrc]: https://github.com/gfontenot/dotfiles/blob/master/rcrc

## attribution ##

The general organizational pattern that I'm using is heavily inspired by
[holman]. I originally forked his dotfiles years ago, and fell in love with
the structure.

[holman]: https://github.com/holman/dotfiles

Many scripts and configurations have been inspired by or outright stolen from
my colleagues at [thoughtbot]. Of special note, I've stolen many things from
the [thoughtbot dotfiles], as well as from [Gabe Berke-Williams], [Chris
Toomey], [Pat Brisbin], and [George Brocklehurst], among others that I'm sure
I'm forgetting.

[thoughtbot]: https://thoughtbot.com/
[thoughtbot dotfiles]: https://github.com/thoughtbot/dotfiles
[Gabe Berke-Williams]: https://github.com/gabebw/dotfiles
[Chris Toomey]: https://github.com/christoomey/dotfiles
[Pat Brisbin]: https://github.com/pbrisbin/dotfiles
[George Brocklehurst]: https://github.com/georgebrock/dotfiles
