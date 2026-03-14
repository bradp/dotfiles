#             ██ ██
#            ░██░░
#   ██████   ░██ ██  ██████    ██████  █████   ██████
#  ░░░░░░██  ░██░██ ░░░░░░██  ██░░░░  ██░░░██ ██░░░░
#   ███████  ░██░██  ███████ ░░█████ ░███████░░█████
#  ██░░░░██  ░██░██ ██░░░░██  ░░░░░██░██░░░░  ░░░░░██
# ░░████████ ███░██░░████████ ██████ ░░██████ ██████
#  ░░░░░░░░ ░░░ ░░  ░░░░░░░░ ░░░░░░   ░░░░░░ ░░░░░░
#

#########################################
# Paths                                 #
#########################################
alias box="cd ${HOME}/Dropbox"
alias goo="cd ${HOME}/go/src/github.com/bradp"
alias scr="cd ${HOME}/Dropbox/Working/scratch"
alias scrw="cd ${HOME}/Dropbox/Working/scratch-wp"
alias ww="cd ${HOME}/Dropbox/Working"
alias www="cd ${HOME}/Sites/www"

#########################################
# Replace commands                      #
#########################################
alias ack="ag"
alias artisan="php artisan"
alias caff="caffeinate -dis"
alias cat="bat"
alias e="$EDITOR ."
alias gemini="amfora"
alias ghback="gh-backup"
alias hist="history"
alias hub="gh"
alias imgcat="catimg"
alias ls="x"
alias lynx="lynx -accept_all_cookies -use_mouse -vikeys"
alias markdown="mdcat"
alias ql="qlmanage -p 2>/dev/null"
alias tree="tree -C"
alias v=vim
alias vag="vagrant"
alias vi=vim
alias x="eza -Flam --git --color-scale --icons"
alias c="pbcopy"
alias p="pbpaste"
alias b="bun"

#########################################
# Git                                   #
#########################################
alias g="git"
alias gs="git status"
alias gc="git commit -m"
alias gcb="git fetch && git checkout -b $@ origin/$@"
alias gpre="git pull --rebase origin $1"
alias gcm="git commit -m $@"
alias gun="git reset HEAD $1"
alias guna="git reset HEAD $1"

alias forgit_checkout_branch="gco"
alias kdiff="git difftool -y -t Kaleidoscope"
alias branches="git --no-pager for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias branch="git current-branch"
#########################################
# Un-git git commands                   #
#########################################
alias current-branch="git current-branch"

#########################################
# Editing 							    #
#########################################
alias ssource="source ${DOTFILES_PATH}/.zshrc"

alias codeo="code --reuse-window"
alias ct="code"
alias ctt="code ."

alias st='open -a "Sublime Text"'
alias stt="st ."

alias edit='fc'
#########################################
# Figlet                                #
#########################################
alias 3d="figlet -w 100 -f 3d"
alias 3dfonts="showfigfonts"

#########################################
# Annoyances							#
#########################################
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias xcode-agree="sudo xcodebuild -license accept"

#########################################
# Fun                                   #
#########################################
alias kill9="afplay ${DOTFILES_PATH}/misc/kill-9.wav && kill -9"

#########################################
# Hide / Show files                     #
#########################################
alias unhidelibrary="chflags nohidden ~/Library"

alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

alias hide="chflags hidden $0"
alias unhide="chflags nohidden $0"

#########################################
# Vagrant                               #
#########################################
alias vu="vagrant up && vagrant ssh"
alias vup="vagrant up && vagrant provision && vagrant ssh"
alias vp="vagrant provision"

##########################################
# WordPress                             #
##########################################
alias wpstart=" wp-env start"
alias wup="wp-env start"
alias wpstop="wp-env stop"
alias wpdown="wp-env stop"
alias wown="wp-env stop"

#########################################
# youtube-dl                             #
#########################################
alias dyt="ytdl '${HOME}/Desktop'"
alias myt="ytdl '${HOME}/Dropbox/Documents/Backups/Media'"

#########################################
# Misc                                  #
#########################################
alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias rg="rg --hyperlink-format vscode"
alias pbj="pbpaste|jq . |pbcopy"
alias jbp="pbpaste|jq -c . |pbcopy"
alias lastijq="tail -n 1 ~/Library/Application\ Support/ijq/history"
alias "/codex"="codex"

alias openrctfolder="cd /Users/brad/Library/Application\ Support/OpenRCT2 && open ."
alias scratch="cd ${HOME}/Dropbox/Working/scratch"
