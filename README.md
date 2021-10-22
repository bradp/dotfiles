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
|`$`| Strips out the leading `$` when you paste a command.|
|`add-dock-spacer`| Adds a blank space in your Mac's dock|
|`api`| Helper to easily call APIs|
|`backup`| Backup various things|
|`chars`| Display all available nerd-font characters|
|`clean-filename`| Removes spaces, removes numbers, and lowercases a filename|
|`day`| Helper to get your computer ready for the start or end of the day|
|`emoji`| Emoji picker to copy emoji to your clipboard|
|`gh-backup`| Backup various GitHub things|
|`gh-backup-repo`| Backup a GitHub repo|
|`git-current-branch`| `git current-branch` or `current-branch` displays your git branch|
|`git-submodule-remove`| Helper to remove a git submodule|
|`hr`| Output a horizontal line in the terminal|
|`meow`| Alternative `catimg` script|
|`mirror-site`| Run httrack on a full website|
|`pocket-to-notion`| Export all Pocket items to a Notion DB.|
|`pubkey`| Display public key and copy to clipboard.|
|`srht`| Add [sr.ht](https://sr.ht) as a secondary origin remote to a repo, to allow for pushing to both at once.
|`todo`| Add an item to a todo list in Notion|
|`wayback`| Save items to the [Archive.org](http://archive.org) Wayback Machine|
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

### Functions

|Name|Description|
|--|----|
|`1p`| Helper to run 1Password cli |
|`battery`| Get battery percent |
|`bak`| Move `<name>` (files and folders) to `<name>.bak` |
|`unbak`| Move `<name>.bak` to `<name>` |
|`deploy`| Deployments for hugo sites |
|`ha`| Grep for a history entry |
|`hook`| Run a git hook |
|`mkd`| Make a directory and cd into it |
|`pa`| Grep for a running process |
|`purge-cloudflare-cache`| Purge Cloudflare cache |
|`root`| Go to the root of git directory |
|`s`| Quickly jump to site directory |
|`site`| Quickly jump to Sites/www/site |

### Aliases

_Note:_ This is just a few of the many aliases set up.

|Name|Description|
|--|----|
|`3d <text>`|Display text as 3d|
|`c`|Alias of `pbcopy`|
|`p`| Alias of `pbpaste`|
|`cleanup`| Delete all `.DS_Store` files|
|`codeo <file>`| Open a file in the current VSCode window|
|`f`| File picker using `fzf`|
|`gcm`| Allows you to do `gcm This is my commit message`|
|`vu`|Bring up a vagrant machine and ssh into it.|
|`x`| Way better than `ls` |
|`xcode-agree`| Because it's a pain to have to agree every update|
