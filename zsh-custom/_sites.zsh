#          ██   ██
#         ░░   ░██
#   ██████ ██ ██████  █████   ██████
#  ██░░░░ ░██░░░██░  ██░░░██ ██░░░░
# ░░█████ ░██  ░██  ░███████░░█████
#  ░░░░░██░██  ░██  ░██░░░░  ░░░░░██
#  ██████ ░██  ░░██ ░░██████ ██████
# ░░░░░░  ░░    ░░   ░░░░░░ ░░░░░░
#


# quickly jump to site directory
# site <site name>
# s <site name>

site() {
    cd ~/Sites/$1/;
}

_site() {
    _files -W ~/Sites/ -/;
}

s() {
    cd ~/Dropbox/Working/sites/$1/;
}

_s() {
    _files -W ~/Dropbox/Working/sites/ -/;
}

compdef _site site
compdef _s s
