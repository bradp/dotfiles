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
function mkd()  { mkdir -p -- "$@" && cd -- "$@" }

#########################################
# cd to the root of git directory       #
#########################################
function root() { while ! [ -d .git ]; do cd ..; done }

#########################################
# Grep for a running process            #
#########################################
function pa() { ps aux | ag "$*"; }

#########################################
# Grep for a history entry              #
#########################################
function ha() { history | ag "$*"; }

#########################################
# Add a spacer to the Dock              #
#########################################
function add-dock-spacer() { defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock; }

#########################################
# Run httrack on a website              #
#########################################
function htrack() {  httrack "https://${1}/" -O "${1//\//-}" "+*.${1}/*" --depth=1000 --display --disable-security-limits --max-rate=10000000000 -c256 -I0; }

#########################################
# Create a directory like  2021-07-18   #
#########################################
function dirdate() { mkdir $(date +%F); }

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
