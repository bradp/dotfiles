#########################################
# Deployments                           #
#########################################
function deploy() {
	# go to the site dir, or use the one we're in
	SITE=${1:-$(basename $(pwd))}
	cd ~/Dropbox/Working/sites/"$SITE" || return

	# clean up files
	rm .DS_Store 2> /dev/null

	# build the site
	hugo --gc --minify

	# fix hugo's breaking of timestamps
	[ -d "public" ] && touch public

	# push it up
	rsync -avz --verbose --human-readable --progress --delete public/ root@direct.bradparbs.com:/var/www/"$SITE"/html/

	# bust the cache
	if [ "$SITE" = "bradparbs" ]; then
		purge-cloudflare-cache 3b95b43a83cb019d613bf322ae4b17a6;
	fi
}

_deploy() {
    _files -W ~/Dropbox/Working/sites/ -/;
}

compdef _deploy deploy
