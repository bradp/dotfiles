#          ██   ██
#         ░░   ░██
#   ██████ ██ ██████  █████   ██████
#  ██░░░░ ░██░░░██░  ██░░░██ ██░░░░
# ░░█████ ░██  ░██  ░███████░░█████
#  ░░░░░██░██  ░██  ░██░░░░  ░░░░░██
#  ██████ ░██  ░░██ ░░██████ ██████
# ░░░░░░  ░░    ░░   ░░░░░░ ░░░░░░
#

# This sets up a function of 'site <site name>' that will navigate you directly
# to the inner folder of a site on your system. Simply change the directory names
# below for the folder structure you use.
site() {
    cd ~/Sites/$1/;
}

# This is our tab-completion definition. This will let you type 'site <TAB>' to
# get a list of all your sites. This will need to be update to match your structure.
_site() {
    _files -W ~/Sites/ -/;
}
compdef _site site
