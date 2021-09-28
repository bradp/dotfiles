#                                        ██           ██   ██
#                               ██████  ░██          ░██  ░░
#   █████   ██████  ██████████ ░██░░░██ ░██  █████  ██████ ██  ██████  ███████
#  ██░░░██ ██░░░░██░░██░░██░░██░██  ░██ ░██ ██░░░██░░░██░ ░██ ██░░░░██░░██░░░██
# ░██  ░░ ░██   ░██ ░██ ░██ ░██░██████  ░██░███████  ░██  ░██░██   ░██ ░██  ░██
# ░██   ██░██   ░██ ░██ ░██ ░██░██░░░   ░██░██░░░░   ░██  ░██░██   ░██ ░██  ░██
# ░░█████ ░░██████  ███ ░██ ░██░██      ███░░██████  ░░██ ░██░░██████  ███  ░██
#  ░░░░░   ░░░░░░  ░░░  ░░  ░░ ░░      ░░░  ░░░░░░    ░░  ░░  ░░░░░░  ░░░   ░░
#


########################################
# FZF COMPLETION                       #
########################################
_fzf_compgen_path() { fd --hidden --follow --exclude ".git" . "$1" }
_fzf_compgen_dir() { fd --type d --hidden --follow --exclude ".git" . "$1" }

########################################
# Commands                             #
########################################
_artisan_get_command_list () { IFS=" "; php artisan --no-ansi | sed "1,/Available commands/d" | awk '/ [a-z]+/ { print $1 }' | sed -E 's/^[ ]+//g' | sed -E 's/[:]+/\\:/g' | sed -E 's/[ ]{2,}/\:/g' }
_artisan () { if [ -f artisan ]; then local -a commands; IFS=$'\n'; commands=(`_artisan_get_command_list`); _describe 'commands' commands; fi }
compdef _artisan php artisan
compdef _artisan artisan

########################################
# Functions / Aliases                  #
########################################
_deploy() { _files -W $HOME/Dropbox/Working/sites/ -/}
compdef _deploy deploy

_hook() { root; compadd "${(@)${(f)$(ls .git/hooks | grep -v "\.sample")}}" }
compdef _hook hook

_unbak() { compadd "${(@)$(ls *.bak)}" }
compdef _unbak unbak
