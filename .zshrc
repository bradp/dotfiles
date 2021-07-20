#	                ██
#	               ░██
#	 ██████  ██████░██      ██████  █████
#	░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#	   ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#	  ██    ░░░░░██░██  ░██ ░██   ░██   ██
#	 ██████ ██████ ░██  ░██░███   ░░█████
#	░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

export DOTFILES_PATH="$HOME/dotfiles"

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

ZSH_CUSTOM="$DOTFILES_PATH"/zsh-custom
ZSH_THEME="parbs"

plugins=(
	composer
	dash
	forgit
	fzf
	git-extras
	rsync
	z
	zf
	zsh-syntax-highlighting
)

source "$DOTFILES_PATH"/.oh-my-zsh/oh-my-zsh.sh

path+=(/usr/local/bin)
path+=("$DOTFILES_PATH"/misc)
path+=("$DOTFILES_PATH"/bin)
path+=("$HOME"/.yarn/bin)
path+=("$HOME"/.cargo/bin)
path+=("$HOME"/go/bin)
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
