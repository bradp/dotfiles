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

alias ghback="gh-backup"

#########################################
# Replace commands                      #
#########################################
alias ack="ag"
alias cat="bat"
alias gemini="amfora"
alias hub="gh"
alias imgcat="catimg"
alias lynx="lynx -accept_all_cookies -use_mouse -vikeys $@"
alias x="exa -Flam --git --color-scale --icons"
alias ls="x"
alias hist="history"
alias tree="tree -C"
alias kdiff="git difftool -y -t Kaleidoscope"

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
alias php7="/usr/local/opt/php@7.4/bin/php"

alias pc='phpcs --standard=parbs $@'
alias pcf='phpcbf --standard=parbs $@'
alias pcbfall='find . | grep .php | xargs phpcbf --standard=parbs --ignore=node_modules/'
alias pcsall='find . | grep .php | xargs phpcs --standard=parbs --ignore=node_modules/'
alias pcsalle='find . | grep .php | xargs phpcs -n --standard=parbs --ignore=node_modules/'
alias lint="phpcs -s -p -n . --standard=parbs --extensions=php -n --colors"

alias phpfixer="php-cs-fixer --config=$HOME/dotfiles/.php-cs-fixer.php --allow-risky=yes --show-progress=dots"
alias phpinsights="phpinsights --config-path=$HOME/dotfiles/.phpinsights-config.php"
alias phpi="phpinsights"

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

alias ql="qlmanage -p" # Quick-look a file
alias exot="exit"
alias foot="tail"

alias yt="youtube-dl --mark-watched $@"
alias dyt="cd ~/Desktop/; yt $@"
alias myt="cd ~/Documents/Media/YT; yt $@"

alias e="$EDITOR ."
alias lss="ls -Gal"

alias dc="docker compose"
alias ctop="docker run --rm -ti -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest"

alias qlook="qlmanage -p 2>/dev/null"
alias st='open -a "Sublime Text"'
alias stt="st ."

alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
