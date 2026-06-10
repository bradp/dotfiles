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
mkd() {
	mkdir -p -- "$@" && cd -- "$@" || exit
}

################################################
# Go to the root of the current git repository #
################################################
root() {
	local git_root
	git_root=$(git rev-parse --show-toplevel 2> /dev/null) || return

	cd "$git_root" || return
}

#########################################
# Search running processes              #
#########################################
pa() {
	ps aux | rg "$*"
}

#########################################
# Search shell history                  #
#########################################
ha() {
	history | rg "$*"
}

################################################################
# Open a file, or the current directory when no file is passed #
################################################################
o() {
	open "${1:-.}"
}

#########################################
# Sign in to 1Password                  #
#########################################
1p() {
	eval $(op signin my)
}

#########################################
# Open a Dash documentation search      #
#########################################
dash() {
	open "dash://${1}"
}

########################################################
# Print public IP address and copy it to the clipboard #
########################################################
ip() {
	local ip

	ip=$(curl -s ifconfig.me)
	echo "$ip"
	echo "$ip" | pbcopy
}

#########################################
# Run a git hook by name                #
#########################################
hook() {
	local current_dir
	current_dir=$(pwd)

	root

	if [ -f ".git/hooks/${1}" ]; then
		. ".git/hooks/${1}"
	fi

	cd "${current_dir}"
}

#########################################
# Complete git hook names               #
#########################################
_hook() { root && compadd "${(@)${(f)$(ls .git/hooks | grep -v "\.sample")}}"; }
compdef _hook hook
compdef _hook git-hook

#########################################
# Move a target to target.bak           #
#########################################
# Based on https://github.com/shazow/dotfiles/
#
bak() {
	declare target=$1;
	if [[ "${target:0-1}" = "/" ]]; then
		target=${target%%/}; # Strip trailing / of directories
	fi
	mv -v $target{,.bak}
}

#########################################
# Complete backup files                 #
#########################################
_bak() {
	compadd "${(@)$(ls *.bak)}"
}
compdef _bak bak

#########################################
# Move a target.bak file back to target #
#########################################
# Based on https://github.com/shazow/dotfiles/
#
unbak() {
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

#########################################
# Complete backup files                 #
#########################################
_unbak() {
	compadd "${(@)$(ls *.bak)}"
}
compdef _unbak unbak


#########################################
# Print battery percent                 #
#########################################
battery() {
	local batt
	batt=$(pmset -g batt)
	batt=($(echo "${batt}" | tr '	' '\n'))
	local percent="${batt[8]}"
	percent=${percent//\;/}

	echo "${percent}"
}

##############################################
# Purge Cloudflare cache for a selected zone #
##############################################
purge-cloudflare-cache() {
	local zone
	zone=$(api cf zones | \
	jq -r '.result[] | [.name, .id] | flatten | @csv' | \
	sed 's/"//g' | \
	sed 's/,/ /g' | \
	fzf --query="${1}" --select-1 --no-multi --cycle --layout=reverse --height=25 --prompt='' --with-nth 1 --delimiter=" " --border=none --color=dark --color="gutter:-1")

	local zone_id
	local zone_name
	zone_id=$(echo "${zone}" | cut -d' ' -f2)
	zone_name=$(echo "${zone}" | cut -d' ' -f1)

	local diditwork
	diditwork=$(curl -X -sSL POST "https://api.cloudflare.com/client/v4/zones/${zone_id}/purge_cache" \
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
# Deploy a Hugo site                    #
#########################################
deploy() {
	local site

	site=${1:-$(basename "$(pwd)")}

	cd "${HOME}/Dropbox/Working/sites/${site}" || exit

	hugo --gc --minify --environment production

	# Fix hugo's breaking of timestamps.
	if [[ -d "public" ]]; then touch public; fi

	rm .DS_Store 2> /dev/null

	rsync -avz --verbose --human-readable --progress --delete public/ root@"${XAVIER}":/var/www/"${1}"/html/
}

#########################################
# Complete Hugo site names              #
#########################################
_deploy() {
	_files -W ${HOME}/Dropbox/Working/sites/ -/
}
compdef _deploy deploy

#################################################
# Quickly jump to a Sites/www content directory #
#################################################
site() {
    cd "${HOME}/Sites/www/${1}/content/"
}

#########################################
# Complete Sites/www directory names    #
#########################################
_site() {
	_files -W ${HOME}/Sites/www -/
}
compdef _site site

############################################
# Quickly jump to a working site directory #
############################################
s() {
    cd "${HOME}/Dropbox/Working/sites/${1}/"
}

#########################################
# Complete working site directory names #
#########################################
_s() {
	_files -W "${HOME}/Dropbox/Working/sites/" -/
}
compdef _s s

#########################################
# Push the current git branch to origin #
#########################################
gpob() {
	local branch

	branch=$(git rev-parse --abbrev-ref HEAD | tr -d '\n' | tr -d ' ')
	git push origin "$branch"
}
