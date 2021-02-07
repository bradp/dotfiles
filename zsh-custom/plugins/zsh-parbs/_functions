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
# Directories                           #
#########################################
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

#########################################
# Git                                   #
#########################################
# Runs `git pull` on every directory within the current directory
function gitupdateall() {
	find . -type d -print -maxdepth 1 -execdir git --git-dir={}/.git --work-tree=$PWD/{} pull \;
}


function newchassis() {
	git clone --recursive --single-branch --depth 1 https://github.com/Chassis/Chassis "$HOME"/Sites/"$1";
	cd "$1" || exit;
	trash .git;
	vagrant up --provsion;
}
