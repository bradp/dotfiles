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

# cd to the root of git directory
function root() {
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

# Grep for a running process
function pa() {
    ps aux | ag "$*"
}

# Grep for a history entry
function ha() {
	history | ag "$*"
}

# Get battery percent
function battery() {
	batt=$(pmset -g batt)

	batt=($(echo "$batt" | tr '	' '\n'))
	percent="${batt[8]}"
	percent=${percent//\;/}

	echo "$percent"
}

function bookmarks() {
     bookmarks_path=~/Library/Application\ Support/Google/Chrome/Default/Bookmarks

     jq_script='
        def ancestors: while(. | length >= 2; del(.[-1,-2]));
        . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .path + "/" + .name + "\t" + .url'

    jq -r "$jq_script" < "$bookmarks_path" \
        | sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' \
        | fzf --ansi \
        | cut -d$'\t' -f2 \
        | xargs open
}

function srht() {
    local name
    local repo

    name=$(basename "$PWD")

    git remote rm origin
    git remote add origin git@github.com:bradp/"${name}".git
    git remote set-url --add --push origin git@github.com:bradp/"${name}".git
	git remote set-url --add --push origin git@git.sr.ht:\~bp/"${name}"

    git push origin --all
    git push origin --tags
}
