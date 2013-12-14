# gfontenot's dotfiles #

A user's dotfiles are a collection of configurations and utilities used to
work from day to day. These are mine.

## Organization ##

These dotfiles were initially forked from [holman][]'s dotfiles, and so are
laid out in a similar fashion. I prefer grouping my various configurations by
tool, and breaking up those configurations into modular pieces wherever
possible. My Vim configuration is a good example of this.

[holman]: https://github.com/holman/dotfiles

- Any files ending in `.symlink` will be symlinked into your home directory.
  So `git/gitconfig.symlink` gets symlinked to `.gitconfig`.
- Any file ending in `.zsh` will be sourced by the main zsh configuration
- Any file inside `vim/config` ending in `.vim` will be sourced by the main
  Vim configuration

## Installation ##

Running `rake` will move all the files into place. It's a sledgehammer,
honestly, so you might want to be careful. It will remove existing files at
that location and replace them with the ones inside this repo.

You can also run `brew bundle` to install the applications listed in the
`Brewfile`.

## Interesting things ##

I use Vim for everything. Specifically MacVim. `vim` has been aliased to `mvim
-v` because I use MacVim in the terminal. I'm aware that I'm insane. I also
have a little script `e` in my bin. `e` allows me to open the current dir or a
specified file in `$EDITOR`. That was supper useful when I was constantly
switching text editors every week. Now it's just a force of habit, and it's
also 2 fewer keystrokes than typing `vim` every time.

Echoing the `e` command, I have an alias for `x` to open the current directory
with Xcode. No idea how often I type that one every day, but it's pretty
awesome.

I use Mutt for email (see above disclaimer about sanity). I _really_ like it,
but it can be a lot to deal with during setup. If you are looking to set up
Mutt, my dotfiles might help get you there. But I would also recommend reading
[Pat Brisbin's blog post][brisbin-mutt] on his setup, as well as
[The Homely Mutt][homely-mutt].

[brisbin-mutt]: http://pbrisbin.com/posts/mutt_gmail_offlineimap/
[homely-mutt]: http://stevelosh.com/blog/2012/10/the-homely-mutt/
