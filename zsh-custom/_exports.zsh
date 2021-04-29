#	                                           ██
#	                 ██████                   ░██
#	  █████  ██   ██░██░░░██  ██████  ██████ ██████  ██████
#	 ██░░░██░░██ ██ ░██  ░██ ██░░░░██░░██░░█░░░██░  ██░░░░
#	░███████ ░░███  ░██████ ░██   ░██ ░██ ░   ░██  ░░█████
#	░██░░░░   ██░██ ░██░░░  ░██   ░██ ░██     ░██   ░░░░░██
#	░░██████ ██ ░░██░██     ░░██████ ░███     ░░██  ██████
#	 ░░░░░░ ░░   ░░ ░░       ░░░░░░  ░░░       ░░  ░░░░░░
#

#########################################
# Language                              #
#########################################
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

#########################################
# History                               #
#########################################
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

#########################################
# Homebrew                              #
#########################################
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_ANALYTICS=1

#########################################
# Config set                            #
#########################################
export EDITOR="vim";
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export GREP_OPTIONS="--color=auto";
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export GOPATH="$HOME/go"

export GPG_TTY=$(tty)

export NEXT_TELEMETRY_DISABLED=1
