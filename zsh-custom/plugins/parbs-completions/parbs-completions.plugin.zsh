#                                        ██           ██   ██
#                               ██████  ░██          ░██  ░░
#   █████   ██████  ██████████ ░██░░░██ ░██  █████  ██████ ██  ██████  ███████   ██████
#  ██░░░██ ██░░░░██░░██░░██░░██░██  ░██ ░██ ██░░░██░░░██░ ░██ ██░░░░██░░██░░░██ ██░░░░
# ░██  ░░ ░██   ░██ ░██ ░██ ░██░██████  ░██░███████  ░██  ░██░██   ░██ ░██  ░██░░█████
# ░██   ██░██   ░██ ░██ ░██ ░██░██░░░   ░██░██░░░░   ░██  ░██░██   ░██ ░██  ░██ ░░░░░██
# ░░█████ ░░██████  ███ ░██ ░██░██      ███░░██████  ░░██ ░██░░██████  ███  ░██ ██████
#  ░░░░░   ░░░░░░  ░░░  ░░  ░░ ░░      ░░░  ░░░░░░    ░░  ░░  ░░░░░░  ░░░   ░░ ░░░░░░
#

PARBS_COMPLETIONS="${0:A:h}"

_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" . "$1"
}

_artisan_get_command_list() {
	IFS=" "
	php artisan --no-ansi | sed "1,/Available commands/d" | awk '/ [a-z]+/ { print $1 }' | sed -E 's/^[ ]+//g' | sed -E 's/[:]+/\\:/g' | sed -E 's/[ ]{2,}/\:/g'
}

_artisan_completion() {
	if [ -f artisan ]; then
		IFS=$'\n'
		local -a commands=($(_artisan_get_command_list))
		_describe 'commands' commands
	fi
}
compdef _artisan_completion artisan

_npm_completion() {
	local si=$IFS
	compadd -- $(COMP_CWORD=$((CURRENT-1)) COMP_LINE=$BUFFER COMP_POINT=0 npm completion -- "${words[@]}" 2>/dev/null)
	IFS=$si
}
compdef _npm_completion npm

_deploy_completion() {
	_files -W "$HOME/Dropbox/Working/sites/" -/
}
compdef _deploy_completion deploy

# Example
# _api_completion() {
# 	local -a providers=( \
# 		'cloudflare:CloudFlare API' \
# 		'github:GitHub API' \
# 		'pocket:Pocket API' \
# 		'movie:MovieDB API' \
# 		'weather:OpenWeatherMap API' \
# 	)
# 	_describe 'commands' providers
# }
# compdef _api_completion api
