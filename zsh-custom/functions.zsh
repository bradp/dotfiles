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
# Create a directory like  2021-07-18   #
#########################################
function dirdate() {
	mkdir $(date +%F)
}

#########################################
# cd to the root of git directory       #
#########################################
function root() {
	while ! [ -d .git ];
		do cd ..
	done
}

#########################################
# Grep for a running process            #
#########################################
function pa() {
	ps aux | ag "$*"
}

#########################################
# Grep for a history entry              #
#########################################
function ha() {
	history | ag "$*"
}

#########################################
# Add a spacer to the Dock              #
#########################################
function add-dock-spacer() {
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
	killall Dock
}

#########################################
# Run httrack on a website              #
#########################################
function htrack() {
	httrack "https://${1}/" -O "${1//\//-}" "+*.${1}/*" --depth=1000 --display --disable-security-limits --max-rate=10000000000 -c256 -I0
}

########################################
# Run a git hook                       #
########################################
function hook() {
	local current_dir=$(pwd)
	root

	if [ -f .git/hooks/$1 ]; then
		. .git/hooks/$1
	fi

	cd $current_dir
}

########################################
# Backup pocket repos                  #
########################################
function backup-pocket-repos() {
	api pocket /get | jq -r '.list | .[].resolved_url' | ag 'https://github' | sed 's/https:\/\/github.com\///g' | xargs -L 1 gh-backup-repo
}

#########################################
# Go up N directories                   #
#                                       #
# taken from https://git.io/updir       #
#########################################
function up() {
	if [[ "${1}" == "" ]]; then
		cd ..
			elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
			echo "Error: argument must be a number"
			elif ! [[ "${1}" -gt "0" ]]; then
			echo "Error: argument must be positive"
	else
		for i in {1..${1}}; do
			cd ..
		done
	fi
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

#########################################
# Get battery percent                   #
#########################################
function battery() {
	local batt=$(pmset -g batt)
	batt=($(echo "${batt}" | tr '	' '\n'))
	percent="${batt[8]}"
	percent=${percent//\;/}

	echo "${percent}"
}

#########################################
# Output a horizontal line              #
#########################################
function hr() {
	echo ""
	echo -ne "  \033[34m\033[0m"

	echo -ne "\033[44m"
	for i in $(seq 1 $(echo $(tput cols) - 6 | bc)); do
		echo -n " "
	done
	echo -ne "\033[0m"

	echo -ne "\033[34m  \033[0m"
}

#########################################
# youtube-dl helpers                    #
#########################################
function ytdl() {
	local current_dir=$(pwd)
	local video_url="$1"

	if [ ! -z "$2" ]; then
		video_url="$2"

		cd "$1" || return
	fi

	yt-dlp --mark-watched --embed-subs --embed-metadata --sponsorblock-remove sponsor,selfpromo -o '%(title)s.%(id)s.%(ext)s' "$video_url"

	cd "$current_dir"
}

#########################################
# Clean filenames                       #
# Removes spaces and lowercases it      #
#########################################
function clean-filename() {
	local new_name="${1// /-}"
	new_name="$( echo "$new_name" | tr '[:upper:]' '[:lower:]' )"

	if [ "$new_name" != "$1" ]; then
		mv -v "$1" "${new_name}"
	else
		echo "Skipping $1 → $new_name"
	fi
}

#########################################
# Purge Cloudflare cache                #
#########################################
function purge-cloudflare-cache() {
	curl -X POST "https://api.cloudflare.com/client/v4/zones/$1/purge_cache" \
	-H "Authorization: Bearer $CLOUDFLARE_TOKEN" \
	-H "Content-Type:application/json" \
	--data '{"purge_everything":true}'
}

#########################################
# Deployments for hugo sites            #
#########################################
function deploy() {
	local site=${1:-$(basename $(pwd))}

	# go to the site dir, or use the one we're in
	cd "$HOME/Dropbox/Working/sites/${site}" || exit

	# clean up files
	rm .DS_Store 2> /dev/null

	# build the site
	hugo --gc --minify --environment production

	# fix hugo's breaking of timestamps
	if [[ -d "public" ]]; then
		touch public
	fi

	# push it up
	rsync -avz --verbose --human-readable --progress --delete public/ root@"$XAVIER":/var/www/"$1"/html/

	# bust the cache
	if [ "$SITE" = "bradparbs.com" ]; then
		purge-cloudflare-cache "$BP_CLOUD_FLARE_ZONE";
	fi
}
