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
alias box="cd $HOME/Dropbox"
alias goo="cd $HOME/go/src/github.com/bradp"
alias scr="cd $HOME/Dropbox/Working/scratch"
alias sites="cd $HOME/Sites"
alias ww="cd $HOME/Dropbox/Working"
alias ws="cd $HOME/Dropbox/Working/sites"

#########################################
# Replace commands                      #
#########################################
alias ack="ag"
alias cat="bat"
alias e="$EDITOR ."
alias gemini="amfora"
alias ghback="gh-backup"
alias hist="history"
alias hub="gh"
alias imgcat="catimg"
alias ls="x"
alias lynx="lynx -accept_all_cookies -use_mouse -vikeys $@"
alias tree="tree -C"
alias v=vim
alias vi=vim
alias x="exa -Flam --git --color-scale --icons"

alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias kdiff="git difftool -y -t Kaleidoscope"
alias lss="ls -Gal"
alias qlook="qlmanage -p 2>/dev/null"

#########################################
# Git                                   #
#########################################
alias g="git"
alias gs="git status"
alias gc="git commit -m"
alias gcb="git fetch && git checkout -b $@ origin/$@"
alias gpre="git pull --rebase origin $1"

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

#########################################
# PHPCS                                 #
#########################################
alias lint="phpcs -s -p -n . --standard=parbs --extensions=php -n --colors"

alias pcs='phpcs --standard=parbs $@'
alias pcsall='find . | grep .php | xargs phpcs --standard=parbs --ignore=node_modules/'

alias pcbf='phpcbf --standard=parbs $@'
alias pcbfall='find . | grep .php | xargs phpcbf --standard=parbs --ignore=node_modules/'

alias phpfixer="php-cs-fixer --config=$DOTFILES_PATH/.php-cs-fixer.php --allow-risky=yes --show-progress=dots"
alias phpinsights="phpinsights --config-path=$DOTFILES_PATH/.phpinsights-config.php"
alias phpi="phpinsights"

#########################################
# youtube-dl                             #
#########################################

alias yt="youtube-dl --mark-watched $@"
alias dyt="cd ~/Desktop/; yt $@"
alias myt="cd ~/Documents/Media/YT; yt $@"

#########################################
# Fun                                   #
#########################################
alias kill9="afplay $DOTFILES_PATH/misc/kill-9.wav && kill -9 $1"

#########################################
# Misc                                  #
#########################################
alias ssource="source $DOTFILES_PATH/.zshrc"

alias 3d="figlet -f 3d $1"
alias 3dfonts="showfigfonts"
alias bell='echo "\a"'
alias caff="caffeinate -dis"
alias tailf="less +F $0"
alias sha256="shasum -a 256 "$1" "

alias st='open -a "Sublime Text"'
alias stt="st ."
