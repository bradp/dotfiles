```
      ██            ██     ████ ██  ██
     ░██           ░██    ░██░ ░░  ░██
     ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
  ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░
 ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████
░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████
 ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░

```
![](http://gifsb.in/codes/floppy-discs.gif)

## Quick installation:


```
$ cd ~
$ git clone --recursive git@github.com:bradp/dotfiles.git
$ rake
```
OR

``curl https://raw.githubusercontent.com/bradp/dotfiles/master/misc/bootstrap | sudo bash`` to also install all requirments (Zsh, and friends, etc.)

## How to use

This repo contains a Rakefile that does some magic things.

``` $ rake ``` - Will overwrite your existing dotfiles and symlink ours to your home directory.

``` $ rake setup_file[ .filename .file2 ] ``` - Symlink new files that you've added to the dotfiles/ directory.

## Curious about my setup?

Check out [my blog post](http://webdevstudios.com/2015/02/10/a-beginners-guide-to-the-best-command-line-tools/) on getting started.

## What it includes

* **`bin/`** Miscellaneous scripts. This is also added to your path. Contains:
 	* `$` for when you accidently copy a command from the internet.
 	* `api` helper to easily call APIs
	* `day` helper to start or end my day
 	* `colors-sample` Test your terminal colors. From [here](https://github.com/xero/dotfiles/blob/master/fun/code/fun/colorscheme).
 	* `gh-backup` Backup a github repo with metadata to b2
 	* `imgcat` meow meow images on your terminal
 	* `pping` a better ping
 	* `replace` - Find and replace by a given list of files. `replace foo bar **/*.txt` From [here](https://github.com/thoughtbot/dotfiles/blob/master/bin/replace).
* **`.oh-my-zsh/`** Submodule checkout of [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh).
* **`.vim/`** My Vim plugins.
* **`zsh-custom`** This is where plugins & themes go, as well as any files to be sourced:
  * **`_aliases.zsh`** Aliases.
  * **`_exports.zsh`** Environment exports.
  * **`_functions.zsh`** Like aliases, but more bigger
  * **`_lights.zsh`** This controls my lights
  * **`_misc.zsh`** Whatever
  * **`_paths.zsh`** Quick aliases to move to certain directories
  * **`_sites.zsh`** Helper to move around my site directories
* **`.gemrc`** Speeds up gem installation.
* **`.gitconfig`** Make git awesome.
* **`.global_ignore`** Our global git ignore.
* **`.hushlogin`** Stop the login message when logging into remote servers.
* **`.vimrc`** Vim settings.
* **`.zshrc`** The magic that makes Zsh behave amazingly.
