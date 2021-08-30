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
function mkd()  {
	mkdir -p -- "$@" && cd -- "$@"
}

#########################################
# cd to the root of git directory       #
#########################################
function root() {
	while ! [ -d .git ]; do
		cd ..
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
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock
}

#########################################
# Run httrack on a website              #
#########################################
function htrack() {
	httrack "https://${1}/" -O "${1//\//-}" "+*.${1}/*" --depth=1000 --display --disable-security-limits --max-rate=10000000000 -c256 -I0
}

#########################################
# Create a directory like  2021-07-18   #
#########################################
function dirdate() {
	mkdir $(date +%F)
}

#########################################
# Git checkout w/ fzf                   #
#########################################
function checkout() {
    git checkout $(git branch | grep -v $(git rev-parse --abbrev-ref HEAD) | fzf)
}

########################################
# Run a git hook                       #
########################################
function hook() {
    CURRENT_DIR=$(pwd)
    root

    if [ -f .git/hooks/$1 ]; then
        . .git/hooks/$1
    fi

    cd $CURRENT_DIR
}

function _hook() {
    root
    compadd "${(@)${(f)$(ls .git/hooks | grep -v "\.sample")}}"
}

compdef _hook hook

########################################
# Backup pocket repos                  #
########################################
function backup-pocket-repos() {
	api pocket /get | jq -r '.list | .[].resolved_url' | ag 'https://github' | sed 's/https:\/\/github.com\///g' | xargs -L 1 gh-backup-repo
}

########################################
# Make scratch directory               #
########################################
alias newdir="scratch"
alias scrath="scratch"

function scratch() {
	newdir="${1}"

	cd "$HOME/Dropbox/Working/scratch" || exit 1

	if [[ -d "${newdir}" ]]; then

		echo "${newdir} already exists"
		exit 1
	fi

	mkdir "${newdir}"

	cd "${newdir}"
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

function _unbak() {
    compadd "${(@)$(ls *.bak)}"
}

compdef _unbak unbak

#########################################
# Get battery percent                   #
#########################################
function battery() {
	batt=$(pmset -g batt)
	batt=($(echo "${batt}" | tr '	' '\n'))
	percent="${batt[8]}"
	percent=${percent//\;/}

	echo "${percent}"
}

#########################################
# Create a new chassis site             #
#########################################
function newchassis() {
    target="${HOME}/Sites/${1}"

    if [[ -d "${target}" ]]; then
        echo "$(tput setaf 1)${target} already exists, exiting.$(tput gr0)"
        exit 1
    fi

    git clone --recursive --single-branch --depth 1 https://github.com/Chassis/Chassis "${target}"
    cd "${target}" || exit
    rm -rf ./git/

    vagrant up --provision
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
    site=${1:-$(basename $(pwd))}

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

_deploy() {
    _files -W $HOME/Dropbox/Working/sites/ -/;
}

compdef _deploy deploy
