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

typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

COMPLETION_WAITING_DOTS="true"


DISABLE_AUTO_UPDATE=true

unsetopt nomatch
setopt APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

plugins=(
	alias-tips
	brew
	colored-man-pages
	git
	git-extras
	osx
	vagrant
	z
	zsh-parbs
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
PATH=${PATH}:"$HOME"/.composer/vendor/bin
PATH=${PATH}:"$HOME"/go/bin
PATH=${PATH}:"$HOME"/.yarn/bin
PATH=${PATH}:/usr/local/MacGPG2/bin

PATH=${PATH}:"$HOME"/dotfiles/misc
PATH=${PATH}:"$HOME"/dotfiles/bin

export PATH=${PATH}
