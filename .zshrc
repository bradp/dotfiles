#	                ██
#	               ░██
#	 ██████  ██████░██      ██████  █████
#	░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#	   ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#	  ██    ░░░░░██░██  ░██ ░██   ░██   ██
#	 ██████ ██████ ░██  ░██░███   ░░█████
#	░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

ZSH=$HOME/dotfiles/.oh-my-zsh
ZSH_THEME="brad-muse"
ZSH_CUSTOM=$HOME/dotfiles/zsh-custom

COMPLETION_WAITING_DOTS=true
DISABLE_AUTO_UPDATE=true
HYPHEN_INSENSITIVE=true

typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red' 'trash' 'underline,fg=red')

unsetopt nomatch

setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt INTERACTIVE_COMMENTS

plugins=(
	alias-tips
	artisan
	colored-man-pages
	composer
	dash
	fzf
	rsync
	z
	zf
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/bin:/bin
PATH=${PATH}:/usr/sbin:/sbin
PATH=${PATH}:/opt/sm/bin
PATH=${PATH}:/opt/sm/pkg/active/bin
PATH=${PATH}:/opt/sm/pkg/active/sbin

PATH=${PATH}:/usr/local/git/bin
PATH=${PATH}:/usr/local/share/npm/bin
PATH=${PATH}:"$HOME"/go/bin
PATH=${PATH}:"$HOME"/.yarn/bin
PATH=${PATH}:/usr/local/MacGPG2/bin

PATH=${PATH}:"$HOME"/dotfiles/misc
PATH=${PATH}:"$HOME"/dotfiles/bin

PATH=${PATH}
