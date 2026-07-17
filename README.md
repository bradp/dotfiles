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

## Installation

Before installing, make sure you grab your favorite font from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) and install it, otherwise things won't look right.

```sh
# Clone the repo to ~/dotfiles
$ git clone --recursive git@github.com:bradp/dotfiles.git ~/dotfiles

# Run the install command
$ bash ~/dotfiles/misc/install
```

## What is included

* **`.config/`**
  * **`amfora/`** [Amfora](https://github.com/makeworld-the-better-one/amfora) settings
  * **`bat/`** [Bat](https://github.com/sharkdp/bat) settings & sytnax files
  * **`gh/`** [GitHub CLI](https://cli.github.com/) settings
  * **`htop/`** [htop](https://github.com/htop-dev/htop) settings
* **`.gnupg/`** [GPG](https://www.gnupg.org/index.html) settings
* **`.vim/`** Vim plugins
* **`bin/`** Scripts and commands. See [Scripts & Commands](#scripts-commands) for info.
* **`misc/`** Miscellaneous files
  * **`cows/`** Custom cows for `cowsay`
  * **`icons/`** Replacement icons for `app` command.
* **`zsh-custom/`** This is where zsh plugins & themes go, as well as any files to be sourced
  * **`plugins/`** Plugins
    * **`forgit/`** [A utility tool powered by fzf for using git](https://github.com/wfxr/forgit)
    * **`parbs-completions/`** Completions for different commands
    * **`parbs-lights/`** Controls my [Philips Hue](https://www.philips-hue.com/) lights
    * **`parbs-nvm-settings/`** My settings to load `nvm` faster.
    * **`speedycompinit/`** `compinit` optimization for oh-my-zsh
    * **`zf/`** [Adds `fzf` completion to `z`](https://github.com/changyuheng/fz)
    * **`zsh-nvm/`** [Install, update, and load `nvm`](https://github.com/lukechilds/zsh-nvm)
    * **`zsh-syntax-highlighting/`** [Syntax highlighting for Zsh](https://github.com/zsh-users/zsh-syntax-highlighting)
  * **`themes/`** Themes
    * **`parbs.zsh-theme/`** My custom theme with a very informative prompt
  * **`_secret.zsh`** Ignored via git, a good place to put any exported API tokens for example
  * **`aliases.zsh`** Aliases
  * **`exports.zsh`** Environment exports
  * **`functions.zsh`** Like aliases, but usually more complex
  * **`fzf.zsh`** Functions that interact with [`fzf`](https://github.com/junegunn/fzf)
  * **`keybinds.zsh`** ZSH keybindings
  * **`misc.zsh`** Whatever things
  * **`zshrc-loaded`** Gets sourced at the end of `.zshrc`, after oh-my-zsh has loaded.
* **`.curlrc`** curl settings.
* **`.gitconfig`** Set up git exactly how it should be
* **`.global_ignore`** Global gitignore, applies to all git repos
* **`.gvimrc`** Vim settings for the GUI
* **`.hushlogin`** Stop the login message when logging into remote servers
* **`.npmrc`** [npm](https://www.npmjs.com/) settings
* **`.nuxtrc`** [Nuxt](https://nuxtjs.org/) settings
* **`.vimrc`** Vim settings
* **`.zshrc`** The magic that makes `Zsh` and [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) behave amazingly.
* **`Brewfile`** List of things to install via [`brew`](https://brew.sh/), `brew-cask`, and `mas`

## Scripts & Commands

### Scripts in `/bin`

|Name|Description|
|--|----|
|`-x`| Mark files as executable |
|`$`| Strips out the leading `$` when you paste a command.|
|`add-dock-spacer`| Adds a blank space in your Mac's dock|
|`ai`| Helper for running AI prompts and utilities|
|`api`| Helper to easily call APIs|
|`backup`| Backup various things|
|`char`| Character picker |
|`chars`| Display all available nerd-font characters|
|`clean-filename`| Removes spaces, removes numbers, and lowercases a filename|
|`copy-local-wp`| Add a local development mu-plugin to a WordPress project|
|`emoji`| Emoji picker to copy emoji to your clipboard|
|`gh-backup`| Backup various GitHub things|
|`gh-backup-repo`| Backup a GitHub repo|
|`hr`| Output a horizontal line in the terminal|
|`meow`| Alternative `catimg` script|
|`mirror-site`| Run httrack on a full website|
|`new-wp-env`| Generate a `.wp-env.json` file for a WordPress project |
|`pocket-to-notion`| Export all Pocket items to a Notion DB.|
|`pubkey`| Display public key and copy to clipboard.|
|`srht`| Add [sr.ht](https://sr.ht) as a secondary origin remote to a repo, to allow for pushing to both at once |
|`todo`| Add an item to a todo list in Notion|
|`version`| Tag the current package version |
|`versioncheckout`| Check out a ref and tag the current package version |
|`wayback`| Save items to the [Archive.org](http://archive.org) Wayback Machine|
|`weather`| Show the current weather summary |
|`yt-backup`| Download a youtube video and push it to b2|
|`ytdl`| Wrapper for youtube-dlp with preffered settings|

### `fzf` commands

|Name|Description|
|--|----|
|`app`| Launch apps. Will display all installed Mac apps with icons. |
|`art`| Run an `artisan` script |
|`bin`| Run a script from the `/bin` directory |
|`bookmarks`| Display and open bookmarks from Chrome |
|`co`| Checkout local git branch |
|`comp`| Run a `composer` script |
|`falias`| Display and run aliases |
|`ffh`| Choose and connect to an SSH host |
|`ffunc`| Display and run a function |
|`gtag`| Create a new git tag according to SemVar |
|`npmr`| Run an `npm` script |
|`proj`| Open a VSCode project |
|`run`| Combines `bin` and `ffunc` to allow you to any of your scripts or commands |

### Keybinds

|Keys|Command|Description|
|--|----|----|
|`ctrl+l`|`eza -Flam --git --color-scale --icons`| List files with git status, icons, and color |
|`ctrl+s`|`git status`| Show git status |
|`ctrl+a`|`git commit -m "`| Start a git commit message |
|`ctrl+f`|`git diff`| Show the current git diff |
|`ctrl+u`|`bun run build`| Run the project build |
|`ctrl+p`|`gpob`| Push the current branch to origin |

### Functions

|Name|Description|
|--|----|
|`1p`| Helper to run 1Password cli |
|`battery`| Get battery percent |
|`bak`| Move `<name>` (files and folders) to `<name>.bak` |
|`deploy`| Deployments for hugo sites |
|`dash`| Open a Dash documentation search |
|`gpob`| Push the current git branch to origin |
|`ha`| Grep for a history entry |
|`hook`| Run a git hook |
|`ip`| Print public IP address and copy it to the clipboard |
|`mkd`| Make a directory and cd into it |
|`o`| Open a file, or the current directory when no file is passed |
|`pa`| Grep for a running process |
|`purge-cloudflare-cache`| Purge Cloudflare cache |
|`root`| Go to the root of git directory |
|`s`| Quickly jump to site directory |
|`site`| Quickly jump to Sites/www/site |
|`unbak`| Move `<name>.bak` to `<name>` |

### Aliases

_Note:_ This is a curated list of common aliases, not every alias.

|Name|Description|
|--|----|
|`3d <text>`|Display text as 3d|
|`ack`|Alias of `ag`|
|`artisan`|Alias of `php artisan`|
|`b`|Alias of `bun`|
|`branch`|Show the current git branch|
|`branches`|List local git branches by recent commit date|
|`box`|Jump to `~/Dropbox`|
|`c`|Alias of `pbcopy`|
|`caff`|Run `caffeinate -dis`|
|`cat`|Alias of `bat`|
|`cleanup`| Delete all `.DS_Store` files|
|`codeo <file>`| Open a file in the current VSCode window|
|`ct`|Alias of `code`|
|`ctt`|Open the current directory in VS Code|
|`f`| File picker using `fzf`|
|`g`|Alias of `git`|
|`gc`|Start a git commit message|
|`gcm`| Allows you to do `gcm This is my commit message`|
|`gpre`|Run `git pull --rebase`|
|`gs`|Alias of `git status`|
|`hist`|Alias of `history`|
|`jbp`|Compact clipboard JSON with `jq` and copy it back|
|`kdiff`|Run Kaleidoscope as a git difftool|
|`p`| Alias of `pbpaste`|
|`pbj`|Pretty-print clipboard JSON with `jq` and copy it back|
|`rg`|Run `rg` with VS Code hyperlink formatting|
|`scr`|Jump to the scratch working directory|
|`scrw`|Jump to the scratch WordPress working directory|
|`showdotfiles`|Show dotfiles in Finder|
|`hidedotfiles`|Hide dotfiles in Finder|
|`wpstart`|Start `wp-env`|
|`wpstop`|Stop `wp-env`|
|`vu`|Bring up a vagrant machine and ssh into it.|
|`ww`|Jump to `~/Dropbox/Working`|
|`x`| Way better than `ls` |
|`xcode-agree`| Because it's a pain to have to agree every update|
