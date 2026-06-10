#	                ██
#	               ░██
#	 ██████  ██████░██      ██████  █████
#	░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#	   ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#	  ██    ░░░░░██░██  ░██ ░██   ░██   ██
#	 ██████ ██████ ░██  ░██░███   ░░█████
#	░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

# zmodload zsh/zprof # Uncomment to profile startup.

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
zstyle ':fzf-tab:*' ignore 3

DOTFILES_PATH=$HOME/dotfiles
ZSH_CUSTOM=$DOTFILES_PATH/zsh-custom
ZSH_THEME="parbs"
export FZF_BASE="/opt/homebrew/bin/fzf"

# Use `fzf`-backed jumps on `z`; keep subdir traversal on `zz`.
export FZ_CMD=z
export FZ_SUBDIR_CMD=zz
export FZ_HISTORY_CD_CMD=zshz
export FZ_SUBDIR_HISTORY_CD_CMD="zshz -c"

plugins=(
	forgit
	parbs-completions
	parbs-lights
	parbs-php
	speedycompinit
	z
	zf
	zsh-syntax-highlighting
)

source $DOTFILES_PATH/.oh-my-zsh/oh-my-zsh.sh
source $ZSH_CUSTOM/zshrc-loaded

typeset -U path
path=(/opt/homebrew/opt/git/bin $path)
path+=($DOTFILES_PATH/misc)
path+=($DOTFILES_PATH/bin)
path+=($DOTFILES_PATH/bin/git)
path+=($DOTFILES_PATH/bin/util)
path+=($HOME/.composer/vendor/bin)
path+=($HOME/.bun/bin)
path+=($HOME/.yarn/bin)
path+=($HOME/.cargo/bin)
path+=($HOME/go/bin)
path+=($HOME/.local/bin)
path+=(/opt/homebrew/bin)
path+=(/usr/local/bin)
path+=(/usr/bin)
path+=(/bin)
path+=(/usr/sbin)
path+=(/sbin)

export PATH

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "$(fnm env --shell zsh)"
fi

# zprof # Uncomment to profile startup.
