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


function cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

function ha() {
	history | ag $@
}
