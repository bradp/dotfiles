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
# Quick config                          #
#########################################
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias ssource="source ~/.zshrc"
alias hosts="sudo $EDITOR /etc/hosts"

#########################################
# Replace commands                      #
#########################################
alias ack="ag"
alias cat="bat"
alias gemini="amfora"
alias hub="gh"
alias lynx="lynx -accept_all_cookies -use_mouse -vikeys $@"
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
alias x="exa -Flam --git --color-scale"

#########################################
# Hide / Show files                     #
#########################################
alias unhidelibrary="chflags nohidden ~/Library"
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hide="chflags hidden $0"
alias unhide="chflags nohidden $0"

#########################################
# File cleanup                          #
#########################################
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#########################################
# Vagrant                               #
#########################################
alias vag="vagrant"
alias vup="vagrant up; vagrant provision; vagrant ssh"
alias vp="vagrant provision"
alias vs='sites && vagrant ssh'

#########################################
# VIM                                   #
#########################################
alias v=vim
alias vi=vim
alias mvi=mvim

#########################################
# IP / Speedtest                        #
#########################################
alias ip="curl ipinfo.io/ip"

#########################################
# PHPCS                                 #
#########################################
alias p="phpcs --standard=vendor/humanmade/codingstandards $@"
alias pc='phpcs --standard="WordPress" $@'
alias pcf='phpcbf --standard="WordPress" $@'
alias pcbfall='find . | grep .php | xargs phpcbf --standard="WordPress" --ignore=node_modules/'
alias pcsall='find . | grep .php | xargs phpcs --standard="WordPress" --ignore=node_modules/'
alias pcsalle='find . | grep .php | xargs phpcs -n --standard="WordPress" --ignore=node_modules/'

#########################################
# Git                                   #
#########################################
alias g="git"
alias gs="git status"
alias gc="git commit -m"
alias gcb="git fetch && git checkout -b $@ origin/$@"
alias gpre="git pull --rebase origin $1"

#########################################
# Fun                                   #
#########################################
alias lol="lolcat"
alias fs='fortune -as | cowsay -f small | lolcat'
alias kill9="afplay ~/dotfiles/misc/kill-9.wav && kill -9 $1"

#########################################
# Misc                                  #
#########################################
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'";
alias bell='echo "\a"'

alias caff="caffeinate -dis"
alias currentdate='date "+%Y.%m.%d"'
alias 3d="figlet -f 3d $1"
alias tailf="less +F $0"
alias sha256="shasum -a 256 "$1" "
alias qr="qrencode "$1" -o - -t utf8"
alias webp="cwebp -q 85 $1.png -o $1.webp"
alias pa="php artisan $@"

alias ql="qlmanage -p" # Quick-look a file
alias exot=exit

alias yt="youtube-dl --mark-watched $@"
alias dyt="cd ~/Desktop/; yt $@"
alias myt="cd ~/Documents/Media/YT; yt $@"

alias please="sudo $@"
alias e="$EDITOR ."
alias lss="ls -Gal"
