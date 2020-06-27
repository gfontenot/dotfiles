# dotfiles #

These are my dotfiles. They are the secret-sauce in my day-to-day workflow. In
this repo, you'll find my config for my favorite command line tools:

- [zsh], my shell of choice
- [git], my source control tool of choice
- [vim] (actually [neovim]) for text editing
- [tmux] for managing sessions and terminal splits
- And more!

[zsh]: http://www.zsh.org/
[git]: https://git-scm.com/
[vim]: http://www.vim.org/
[neovim]: https://neovim.io/
[tmux]: https://github.com/tmux/tmux

## setup ##

After cloning this repo, running `setup/setup` will perform the entire setup
process. You can perform isolated parts of the setup process by running
individual scripts found in `setup`.

## rcm ##

This repo uses [rcm] for management. It's pretty neat, you should check it
out.

[rcm]: https://github.com/thoughtbot/rcm

## repo organization ##

`rcm` will symlink all files into place, keeping the folder structure relative
to the tag root. However, our `rcrc` is explicitly ignoring a few things:

 - `Brewfile` contains our homebrew dependencies , and so doesn't need to be
   symlinked.
 - Anything in our `setup` directory is assumed to be part of the general
   setup process, and so will not be symlinked.

These ignore patterns are being controlled by the `EXCLUDES` key in my
[`rcrc`][rcrc].

[rcrc]: https://github.com/gfontenot/dotfiles/blob/main/rcrc

Additionally, I'm using the `UNDOTTED` key in my `rcrc` to make sure that
`Library` files aren't symlinked into `.Library`. This means I can do things
like add Xcode color schemes, or LaunchAgents into my dotfiles and have them
symlinked into place properly.

## attribution ##

This repo started life as a fork of [holman]'s dotfiles, but is completely
unrecognizable from his now.

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
