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
unsetopt flowcontrol

setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt INTERACTIVE_COMMENTS

typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red' 'trash' 'underline,fg=red')

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:git-checkout:*' sort false

DOTFILES_PATH=$HOME/dotfiles
ZSH_CUSTOM=$DOTFILES_PATH/zsh-custom
ZSH_THEME="parbs"

plugins=(
	forgit
	fzf
	parbs-completions
	parbs-lights
	parbs-nvm-settings
	parbs-php
	speedycompinit
	z
	zf
	zsh-nvm
	zsh-syntax-highlighting
)

source $DOTFILES_PATH/.oh-my-zsh/oh-my-zsh.sh
source $ZSH_CUSTOM/zshrc-loaded

PATH="/bin"
path+=($DOTFILES_PATH/misc)
path+=($DOTFILES_PATH/bin)
path+=($DOTFILES_PATH/bin/git)
path+=($DOTFILES_PATH/bin/util)
path+=($HOME/.composer/vendor/bin)
path+=($HOME/.yarn/bin)
path+=($HOME/.cargo/bin)
path+=($HOME/go/bin)
path+=(/usr/local/bin)
path+=(/usr/local/opt)
path+=(/usr/local/MacGPG2/bin)
path+=(/usr/local/share/npm/bin)
path+=(/usr/local/git/bin)
path+=(/usr/local/bin)
path+=(/usr/bin)
path+=(/bin)
path+=(/usr/local/sbin)
path+=(/usr/sbin)
path+=(/sbin)

export PATH
