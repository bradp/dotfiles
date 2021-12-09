#      ████                            ██   ██
#     ░██░                            ░██  ░░
#    ██████ ██   ██ ███████   █████  ██████ ██  ██████  ███████   ██████
#   ░░░██░ ░██  ░██░░██░░░██ ██░░░██░░░██░ ░██ ██░░░░██░░██░░░██ ██░░░░
#     ░██  ░██  ░██ ░██  ░██░██  ░░   ░██  ░██░██   ░██ ░██  ░██░░█████
#     ░██  ░██  ░██ ░██  ░██░██   ██  ░██  ░██░██   ░██ ░██  ░██ ░░░░░██
#     ░██  ░░██████ ███  ░██░░█████   ░░██ ░██░░██████  ███  ░██ ██████
#     ░░    ░░░░░░ ░░░   ░░  ░░░░░     ░░  ░░  ░░░░░░  ░░░   ░░ ░░░░░░
#

#########################################
# Make a directory and cd into it       #
#########################################
function mkd() {
	mkdir -p -- "$@" && cd -- "$@"
}

#########################################
# Go to the root of git directory       #
#########################################
function root() {
	while ! [ -d .git ]; do cd ..; done
}

#########################################
# Grep for a running process            #
#########################################
function pa() {
	ps aux | rg "$*"
}

#########################################
# Grep for a history entry              #
#########################################
function ha() {
	history | rg "$*"
}

########################################
# Open a file if passed one, otherwise #
# open the current directory           #
#######################################
function o() {
	open "${1:-.}"
}

#########################################
# 1Password 						    #
#########################################
function 1p() {
	eval $(op signin my)
}

########################################
# Run a git hook                       #
########################################
function hook() {
	local current_dir=$(pwd)

	root

	if [ -f ".git/hooks/${1}" ]; then
		. ".git/hooks/${1}"
	fi

	cd "${current_dir}"
}

_hook() { root && compadd "${(@)${(f)$(ls .git/hooks | grep -v "\.sample")}}"; }
compdef _hook hook
compdef _hook git-hook

########################################
# Backup pocket repos                  #
########################################
function backup-pocket-repos() {
	api pocket /get | \
	jq -r '.list | .[].resolved_url' | \
	ag 'https://github' | \
	sed 's/https:\/\/github.com\///g' | \
	xargs -L 1 gh-backup-repo
}

#########################################
# Move target $1 to $1.bak              #
#                                       #
# https://github.com/shazow/dotfiles/   #
#########################################
function bak() {
	declare target=$1;
	if [[ "${target:0-1}" = "/" ]]; then
		target=${target%%/}; # Strip trailing / of directories
	fi
	mv -v $target{,.bak}
}

#########################################
# Move target $1.bak to $1              #
#                                       #
# https://github.com/shazow/dotfiles/   #
#########################################
function unbak() {
	declare target=$1;
	if [[ "${target:0-1}" = "/" ]]; then
		# Strip trailing / of directories
		target="${target%%/}"
	fi

	if [[ "${target:0-4}" = ".bak" ]]; then
		mv -v "$target" "${target%%.bak}"
	else
		echo "No .bak extension, ignoring: $target"
	fi
}

_unbak() { compadd "${(@)$(ls *.bak)}" }
compdef _unbak unbak


#########################################
# Get battery percent                   #
#########################################
function battery() {
	local batt=$(pmset -g batt)
	batt=($(echo "${batt}" | tr '	' '\n'))
	local percent="${batt[8]}"
	percent=${percent//\;/}

	echo "${percent}"
}

#########################################
# Purge Cloudflare cache                #
#########################################
function purge-cloudflare-cache() {
	local zone=$(api cf zones | \
	jq -r '.result[] | [.name, .id] | flatten | @csv' | \
	sed 's/"//g' | \
	sed 's/,/ /g' | \
	fzf --query="${1}" --select-1 --no-multi --cycle --layout=reverse --height=25 --prompt='' --with-nth 1 --delimiter=" " --border=none --color=dark --color="gutter:-1")

	local zone_id=$(echo "${zone}" | cut -d' ' -f2)
	local zone_name=$(echo "${zone}" | cut -d' ' -f1)

	local diditwork=$(curl -X -sSL POST "https://api.cloudflare.com/client/v4/zones/${zone_id}/purge_cache" \
	-H "Authorization: Bearer ${CLOUDFLARE_TOKEN}" \
	-H "Content-Type:application/json" \
	--data '{"purge_everything":true}' | \
	jq -r '.success')

	if [[ "${diditwork}" = "true" ]]; then
		echo "$(tput setaf 2)✓ Purged Cloudflare cache for ${zone_name} (${zone_id})$(tput sgr0)"
	else
		echo "᙮ Failed to purge Cloudflare cache for ${zone_name} (${zone_id})"
	fi
}

#########################################
# Deployments for hugo sites            #
#########################################
function deploy() {
	local site=${1:-$(basename $(pwd))}

	cd "${HOME}/Dropbox/Working/sites/${site}" || exit

	hugo --gc --minify --environment production

	# Fix hugo's breaking of timestamps.
	if [[ -d "public" ]]; then touch public; fi

	rm .DS_Store 2> /dev/null

	rsync -avz --verbose --human-readable --progress --delete public/ root@"${XAVIER}":/var/www/"${1}"/html/
}
_deploy() { _files -W ${HOME}/Dropbox/Working/sites/ -/ }
compdef _deploy deploy

#########################################
# Quickly jump to Sites/www/site        #
#########################################
function site() {
    cd "${HOME}/Sites/www/${1}/content/"
}

_site() { _files -W ${HOME}/Sites/www -/ }
compdef _site site

#########################################
# Quickly jump to site directory        #
#########################################
function s() {
    cd "${HOME}/Dropbox/Working/sites/${1}/"
}

_s() { _files -W "${HOME}/Dropbox/Working/sites/" -/ }
compdef _s s
