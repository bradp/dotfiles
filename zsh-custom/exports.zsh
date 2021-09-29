#	                                           ██
#	                 ██████                   ░██
#	  █████  ██   ██░██░░░██  ██████  ██████ ██████  ██████
#	 ██░░░██░░██ ██ ░██  ░██ ██░░░░██░░██░░█░░░██░  ██░░░░
#	░███████ ░░███  ░██████ ░██   ░██ ░██ ░   ░██  ░░█████
#	░██░░░░   ██░██ ░██░░░  ░██   ░██ ░██     ░██   ░░░░░██
#	░░██████ ██ ░░██░██     ░░██████ ░███     ░░██  ██████
#	 ░░░░░░ ░░   ░░ ░░       ░░░░░░  ░░░       ░░  ░░░░░░
#

export BAT_CONFIG_PATH="$HOME/dotfiles/.config/bat/.bat"

export HOMEBREW_BREWFILE="$DOTFILES_PATH/Brewfile"

export CARGOPATH="$HOME/.cargo"

export COWPATH="/usr/local/Cellar/cowsay/3.04_1/share/cows:$DOTFILES_PATH/misc/cows"

export DOCKER_SCAN_SUGGEST=false

export EDITOR="vim";

export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='ag -l --nocolor --hidden -g ""'
export FZF_DEFAULT_OPTS="--height=90% --info=inline --border --margin=1 --padding=1 --prompt='▶ ' --pointer='▶' --marker='→ ' --cycle --layout=reverse --query="$1" --select-1 --no-multi"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#cbccc6,bg:#1f2430,hl:#707a8c
 --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
 --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
 --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff'

export GATSBY_TELEMETRY_DISABLED=1

export GH_NO_UPDATE_NOTIFIER=1

export GOPATH="$HOME/go"

export GPG_TTY=$(tty)

export GREP_OPTIONS="--color=auto";

export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

export HOMEBREW_BAT=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_INSTALL_BADGE=" 🎉️"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export NEXT_TELEMETRY_DISABLED=1

export PROMPT_EOL_MARK=''

export TIMEFMT="\

$fg[green]%J$reset_color

user : $fg[blue]%U$reset_color
sys  : $fg[blue]%S$reset_color
real : $fg[blue]%E$reset_color
CPU  : $fg[blue]%P$reset_color"
