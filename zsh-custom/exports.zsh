#	                                           ██
#	                 ██████                   ░██
#	  █████  ██   ██░██░░░██  ██████  ██████ ██████  ██████
#	 ██░░░██░░██ ██ ░██  ░██ ██░░░░██░░██░░█░░░██░  ██░░░░
#	░███████ ░░███  ░██████ ░██   ░██ ░██ ░   ░██  ░░█████
#	░██░░░░   ██░██ ░██░░░  ░██   ░██ ░██     ░██   ░░░░░██
#	░░██████ ██ ░░██░██     ░░██████ ░███     ░░██  ██████
#	 ░░░░░░ ░░   ░░ ░░       ░░░░░░  ░░░       ░░  ░░░░░░
#

export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_ANALYTICS=1

export EDITOR="vim";
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export GREP_OPTIONS="--color=auto";
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export GOPATH="$HOME/go"

export GPG_TTY=$(tty)

export NEXT_TELEMETRY_DISABLED=1

export FZF_DEFAULT_OPTS="--ansi \
                        --height=90% --info=inline --border \
                        --margin=1 --padding=1 \
                        --color 'fg:#665c54,fg+:#ebdbb2,hl:#fe8019,bg:#282828,bg+:#3c3836,preview-bg:#223344,border:#fbf1c7' \
                        "
export FZF_COMPLETION_OPTS='--border --info=inline'
