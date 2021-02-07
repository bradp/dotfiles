function hugodeploy() {
	hugo --gc --minify;
	touch public;
	rm .DS_Store 2> /dev/null;
	rsync -avz --verbose  --delete public/ root@direct.bradparbs.com:/var/www/"$1"/html/
}

function clearBradParbsCache() {
	curl -X POST "https://api.cloudflare.com/client/v4/zones/3b95b43a83cb019d613bf322ae4b17a6/purge_cache" \
	-H "Authorization: Bearer dNwPeG73EH_8qfA8zU3wfh-yCQTLlD2Eta1YUrS0" \
	-H "Content-Type:application/json" \
	--data '{"purge_everything":true}'
}

alias parbsup="hugodeploy bradparbs.com bradparbs && clearBradParbsCache"
alias "horrorup"="hugodeploy horror.watch horror.watch"

function deploy

alias deploy="hugodeploy "
