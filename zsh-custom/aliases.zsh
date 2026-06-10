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
# Command replacements                  #
#########################################
alias ack="ag"
alias artisan="php artisan"
alias b="bun"
alias c="pbcopy"
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
alias p="pbpaste"
alias ql="qlmanage -p 2>/dev/null"
alias tree="tree -C"
alias v=vim
alias vag="vagrant"
alias vi=vim
alias x="eza -Flam --git --color-scale --icons"

#########################################
# Git                                   #
#########################################
alias branch="git current-branch"
alias branches="git --no-pager for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias current-branch="git current-branch"
alias forgit_checkout_branch="gco"
alias g="git"
alias gc="git commit -m"
alias gcb="git fetch && git checkout -b $@ origin/$@"
alias gcm="git commit -m $@"
alias gpre="git pull --rebase origin $1"
alias gs="git status"
alias gun="git reset HEAD $1"
alias guna="git reset HEAD $1"
alias kdiff="git difftool -y -t Kaleidoscope"

#########################################
# Editing                               #
#########################################
alias codeo="code --reuse-window"
alias ct="code"
alias ctt="code ."
alias ssource="source ${DOTFILES_PATH}/.zshrc"

#########################################
# Figlet                                #
#########################################
alias 3d="figlet -w 100 -f 3d"
alias 3dfonts="showfigfonts"

#########################################
# Annoyances                            #
#########################################
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias xcode-agree="sudo xcodebuild -license accept"

#########################################
# Fun                                   #
#########################################
alias kill9="afplay ${DOTFILES_PATH}/misc/kill-9.wav && kill -9"

#########################################
# Hide/show files                       #
#########################################
alias hide="chflags hidden $0"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias unhide="chflags nohidden $0"
alias unhidelibrary="chflags nohidden ~/Library"

#########################################
# JQ/JSON                               #
#########################################
alias jbp="pbpaste|jq -c . |pbcopy"
alias lastijq="tail -n 1 ~/Library/Application\ Support/ijq/history"
alias pbj="pbpaste|jq . |pbcopy"

#########################################
# Vagrant                               #
#########################################
alias vp="vagrant provision"
alias vu="vagrant up && vagrant ssh"
alias vup="vagrant up && vagrant provision && vagrant ssh"

#########################################
# WordPress                             #
#########################################
alias wpdown="wp-env stop"
alias wpstart=" wp-env start"
alias wpstop="wp-env stop"
alias wup="wp-env start"
alias wown="wp-env stop"

#########################################
# Misc                                  #
#########################################
alias "/codex"="codex"
alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias rg="rg --hyperlink-format vscode"
