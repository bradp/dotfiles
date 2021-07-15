#	                ██
#	               ░██
#	 ██████  ██████░██      ██████  █████
#	░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#	   ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#	  ██    ░░░░░██░██  ░██ ░██   ░██   ██
#	 ██████ ██████ ░██  ░██░███   ░░█████
#	░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

COMPLETION_WAITING_DOTS=true
DISABLE_AUTO_UPDATE=true
HYPHEN_INSENSITIVE=true

unsetopt nomatch

setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt INTERACTIVE_COMMENTS

typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red' 'trash' 'underline,fg=red')

ZSH_CUSTOM=$HOME/dotfiles/zsh-custom
ZSH_THEME="brad-muse"

plugins=(
	composer
	dash
	fzf
	rsync
	z
	zf
	zsh-syntax-highlighting
)

source $HOME/dotfiles/.oh-my-zsh/oh-my-zsh.sh

path+=(/usr/bin)
path+=(/bin)
path+=(/usr/sbin)
path+=(/sbin)
path+=(/usr/local/bin)
path+=(/usr/local/git/bin)
path+=(/usr/local/share/npm/bin)
path+=(/usr/local/MacGPG2/bin)
path+=("$HOME"/go/bin)
path+=("$HOME"/.cargo/bin)
path+=("$HOME"/.yarn/bin)
path+=("$HOME"/dotfiles/bin)
path+=("$HOME"/dotfiles/misc)

export PATH
