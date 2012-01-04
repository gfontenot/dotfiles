# gfontenot's dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine. These were 
originally forked from [holman](http://www.github.com/holman), but I've modified 
some stuff, and pulled from other sources, such as pulling the prompt style from 
[Ben Hoskings](https://github.com/benhoskings/dot-files). I removed a lot of the 
stuff I had no use for from Holman's dotfiles, and will be adding more of my own 
customizations as I go.

## install

- `git clone git://github.com/holman/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you. Fork it, remove what you
don't use, and build on what you do use.

A couple great ideas and utilities from Holman:

 - `c` and `h` shortcuts for jumping to my projects, or home folder, respectively.
 - `dotedit` and `dotcd` for editing or jumping to these files
 - `e` as an alias for whatever your current `EDITOR` is set to.

A couple of my additions include:

 - `post` and `publish`, for use with a Jekyll blog for creating or publishing new
   blog posts.
 - `release` for assigning `git-tags` to a repo, bumping the version number and
   marketing number for a Mac or iOS app

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.
- **topic/\*.completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions.

## add-ons

There are a few things I use to make my life awesome. They're not a required
dependency, but if you install them they'll make your life a bit more like a
bubble bath.

- If you want some more colors for things like `ls`, install grc: `brew install
  grc`.
- If you install the excellent [rvm](http://rvm.beginrescueend.com) to manage
  multiple rubies, your current branch will show up in the prompt. Bonus.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rvm` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.
