#      ████                            ██   ██
#     ░██░                            ░██  ░░
#    ██████ ██   ██ ███████   █████  ██████ ██  ██████  ███████   ██████
#   ░░░██░ ░██  ░██░░██░░░██ ██░░░██░░░██░ ░██ ██░░░░██░░██░░░██ ██░░░░
#     ░██  ░██  ░██ ░██  ░██░██  ░░   ░██  ░██░██   ░██ ░██  ░██░░█████
#     ░██  ░██  ░██ ░██  ░██░██   ██  ░██  ░██░██   ░██ ░██  ░██ ░░░░░██
#     ░██  ░░██████ ███  ░██░░█████   ░░██ ░██░░██████  ███  ░██ ██████
#     ░░    ░░░░░░ ░░░   ░░  ░░░░░     ░░  ░░  ░░░░░░  ░░░   ░░ ░░░░░░
#

# Make a directory and cd into it
function mkd()  {
	mkdir -p -- "$@" && cd -- "$@"
}

# cd to the top of git directory
function cdt() {
	while ! [ -d .git ]; do
		cd ..
	done
}

# Go up N directories from https://git.io/updir
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

# Move user to root of git directory
function root() {
	TEMP_P=$(pwd)
	while ! [ -d .git ]; do
		cd ..
	done
	OLDPWD="$TEMP_PWD"
}

# Grep for a running process
function p() {
    ps aux | ag "$*"
}

# Grep for a history entry
function ha() {
	history | ag $@
}

# Move target $1 to $1.bak
# Example:
#   $ bak helpers.bash
#   helpers.bash -> helpers.bash.bak
# props https://github.com/shazow/dotfiles/blob/master/helpers.bash
function bak() {
    declare target=$1;
    if [[ "${target:0-1}" = "/" ]]; then
        target=${target%%/}; # Strip trailing / of directories
    fi
    mv -v $target{,.bak}
}

# Revert previously bak'd $1 target
# Example:
#   $ unbak *.bak
#   helpers.bash.bak -> helpers.bash
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

# Run httrack on a website
# Example:
#   $ htrack fffff.at
function htrack() {
    httrack "https://$1/" -O "${1//\//-}" "+*.$1/*" --depth=1000 --display --disable-security-limits --max-rate=10000000000 -c256 -I0;
}

# Get number of repos for a GitHub user
# Example:
#   $ how-many-repos bradp
function how-many-repos() {
    curl -sLu "$MY_GH_CREDS" "https://api.github.com/users/$1" | jq -r '.public_repos'
}
