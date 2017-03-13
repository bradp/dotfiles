site() {
    cd ~/Sites/$1/content;
}
_site() {
    _files -W ~/Sites/ -/;
}
compdef _site site
