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

function site() {
    cd "$HOME/Sites/www/$1/content/";
}

_site() {
    _files -W ~/Sites/www -/;
}

function s() {
    cd "$HOME/Dropbox/Working/sites/$1/";
}

_s() {
    _files -W "$HOME/Dropbox/Working/sites/" -/;
}

compdef _site site
compdef _s s
