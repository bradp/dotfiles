#              ██
#             ░░
#  ██████████  ██  ██████  █████
# ░░██░░██░░██░██ ██░░░░  ██░░░██
#  ░██ ░██ ░██░██░░█████ ░██  ░░
#  ░██ ░██ ░██░██ ░░░░░██░██   ██
#  ███ ░██ ░██░██ ██████ ░░█████
# ░░░  ░░  ░░ ░░ ░░░░░░   ░░░░░
#

# Runs `git pull` on every directory within the current directory
function gitupdateall() {
	find . -type d -print -maxdepth 1 -execdir git --git-dir={}/.git --work-tree=$PWD/{} pull \;
}

# Create a new chassis site
function newchassis() {
	git clone --recursive --single-branch --depth 1 https://github.com/Chassis/Chassis "$HOME"/Sites/"$1";
	cd "$1" || exit;
	trash .git;
	vagrant up --provision;
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
    curl -sLu "$MY_GH_TOKEN" "https://api.github.com/users/$1" | jq -r '.public_repos'
}

# Add a spacer to the Dock
function add-dock-spacer() {
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
	killall Dock
}
