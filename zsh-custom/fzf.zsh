#    ████          ████
#   ░██░          ░██░
#  ██████ ██████ ██████
# ░░░██░ ░░░░██ ░░░██░
#   ░██     ██    ░██
#   ░██    ██     ░██
#   ░██   ██████  ░██
#   ░░   ░░░░░░   ░░
#

#########################################
# Checkout local branch                 #
#########################################
co() {
	if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
		return
	fi

	branches=$(git branch --color | grep -v HEAD | sed 's#.* ##' | sed 's#remotes/##')
	target=$(fzf --no-sort --no-multi +e --ansi --preview-window 'right:60%' --preview 'git log --pretty=lo --no-merges --color --oneline --date=human {1} -- | head -200' <<< "$branches")

	git checkout "$@" "$(awk '{print $1}' <<< "$target")"
}

#########################################
# Tag new version                       #
#########################################
gtag() {
	if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
		return
	fi

	current=$(git describe --tags --abbrev=0 | sed 's#v##')
	new=$(echo "$current" | awk -F '.' '{FS="."; OFS="."; $3++; print $0; $2++; $3=0; print $0; $1++; $2=0; print $0}' | fzf --height=5 --color=16 --border=none --info=hidden --header="Current Version: $current" --print-query)

	new=${new//$'\n'/}

	print -z git tag -a "${new}" -m \"Version "${new}"\"
}


#########################################
# Run a composer script                 #
#########################################
comp() {
	if [ -f composer.json ]; then
		print -z "composer run-script $(composer run-script -l --no-ansi 2> /dev/null | sed -n '/post-/!p' | cut -d' ' -f3- | sort | fzf --no-multi --height=25 --prompt='' --border=none --color=dark --color="gutter:-1" | cut -d' ' -f1) "
	fi
}

#########################################
# Run an artisan script                 #
#########################################
art() {
	if [ -f artisan ]; then
		print -z "php artisan $(artisan list --raw | fzf --no-multi --height=25 --prompt='' --border=none --color=dark --color="gutter:-1" | cut -d' ' -f1) "
	fi
}

#########################################
# Run an npm script					    #
#########################################
npmr() {
	if [ -f package.json ]; then
		print -z "npm run-script $(cat package.json | jq -r '.scripts | to_entries[] | [.key, .value] | join("||||")' | column -t -s "||||" | fzf --no-multi --height=25 --prompt='' --border=none --color=dark --color="gutter:-1" | cut -d' ' -f1) "
	fi
}

#########################################
# SSH 								    #
#########################################
ffh() {
	host=$(history | rg --pcre2 '^(?= [\d]+  ssh )(.)+' | cut -d' ' -f5- | sort | uniq | fzf --height=20 --prompt='')

	if [ -n "${host}" ]; then
		ssh "${host}"
	fi
}

#########################################
# Bookmarks			       			    #
#########################################
bookmarks() {
	# https://github.com/junegunn/fzf/wiki/Examples#bookmarks
	bookmarks_path=~/Library/Application\ Support/Google/Chrome/Default/Bookmarks

	jq_script='
		def ancestors: while(. | length >= 2; del(.[-1,-2]));
		. as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join(" / ") } | .path + " / " + .name + "\t" + .url'

	jq -r "${jq_script}" < "${bookmarks_path}" | \
		sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' | \
		sed 's#Bookmarks Bar /##' | \
		fzf --multi --border=none \
		--color="gutter:black,bg:black,pointer:cyan,fg+:cyan,fg+:bold,border:black" \
		--preview-window right,35 \
		--preview='catimg -w 50 -r 2 $(make-tmp-favicon-preview {})' | \
		grep -Eo 'http(?:s?)://[^ >]+' | \
		xargs open
}

#########################################
# Launch app 						    #
#########################################
app() {
	fd '.app' --search-path '/Applications' --search-path '/System/Applications' --search-path '/System/Library/CoreServices/Finder.app/Contents/Applications/' --prune -t d | sort | \
	fzf --delimiter="Applications/" --with-nth=-1 --query="${1}" --select-1 --multi --no-info --prompt='open: ' --reverse --border=none --black \
	--color="gutter:black,bg:black,pointer:cyan,fg+:cyan,fg+:bold,border:black" \
	--preview-window=left,30 \
	--preview='catimg -H "$FZF_PREVIEW_LINES" -r 2 "$(make-tmp-app-icon-preview {+})"' | \
	sed 's/ /\\ /' | \
	xargs open
}

#########################################
# Icon picker 						    #
#########################################
icons() {
	current_dir=$(pwd)
	cd "${HOME}/Dropbox/Photos/Icons/" || { echo "Could not find icons folder"; return; }

 	fd . --type file --extension png | \
	fzf --query="${1}" --exact --border=none --multi --filepath-word --prompt="    " \
	--color=16 --color="preview-bg:white,gutter:-1,border:-1,preview-fg:-1" \
	--preview-window left,50,border-rounded \
	--preview='echo -e "\n\n\n";catimg -w 70 -r 2 $(make-tmp-image-preview {})' | \
	xargs -I{} cp -v {} "${HOME}/Desktop/"

	cd "${current_dir}"
}

#########################################
# Bin 								    #
#########################################
bin() {
	commands=$(command ls $DOTFILES_PATH/bin)
	cmd=$( echo "$commands" | fzf --color=dark --color='gutter:black,bg+:black,prompt:gray,info:black' --preview-window=right,70% --preview='bat --color=always --style=numbers $(which {})')
	print -z "$cmd "
}

#########################################
# Run an alias                          #
#########################################
falias() {
	alias=$(alias | fzf --prompt="   alias: "--color=dark --color='gutter:black,bg+:black,prompt:gray,info:black' --preview-window=top:5,border-none --preview 'alias=$(echo {1} | cut -d "=" -f1); command=$( echo {1} | cut -d "=" -f2 | cut -c 2-); alias="  $alias  ";command="  $command  ";space=$(( $FZF_PREVIEW_COLUMNS/9 )); printf "\e[90;100m%-${space}s\e[0m   \e[90;100m%-${space}s\e[0m\n\e[7;106;90m%-${space}s\e[0m \e[2m→ \e[0m\e[7;102;90m%-${space}s\e[0m\n\e[90;100m%-${space}s\e[0m   \e[90;100m%-${space}s\e[0m" $alias $command $alias $command $alias $command' | cut -d "=" -f1 )

	command=$(which "${alias}" | cut -d':' -f2 | cut -d ' ' -f4-)
	cmdwidth=${#command}

	echo -e "\e[7;102;90m"
	printf "  %-${cmdwidth}s  \n" " "
	printf "  %-${cmdwidth}s  \n" "${command}"
	printf "  %-${cmdwidth}s  \n" " "
	echo -e "\e[0m"

	print -z "${alias} "
}

#########################################
# Run a                        #
#########################################
ffunc() {
	func=$(functions | \
	grep -E -e "^([^_^$(printf '\t')^\s])+? (?:\(\) {)" | \
	cut -d ' ' -f1 | \
	fzf --prompt="   function: " --color=dark --color='gutter:black,bg+:black,prompt:gray,info:black' --preview-window=right,70% --preview 'source .zshrc; which {1} | bat --color=always --style=numbers --language zsh')

	print -z "${func} "
}

#########################################
# Run a or script			    #
#########################################
run() {
	current_dir=$(pwd)
	query="$@"

	funcs=$(cat "${ZSH_CUSTOM}"/*.zsh | grep '^function' | cut -d' ' -f2 | sed 's/(//g' | sed 's/)//g')

	cd "$DOTFILES_PATH/bin" && bins=$(fd . --type f) && cd "$current_dir"

	runit=$(echo "$funcs $bins" | \
	sed -n '/util\//!p' | \
	sed -n '/\$/!p' | \
	sed -n '/^hr$/!p' | \
	sed -n '/^starter$/!p' | \
	fzf --query=$query --prompt="   run: " --color=dark \
	--color='gutter:black,bg+:black,prompt:gray,info:black' \
	--preview-window=right,80% \
	--preview '
	if [ -z $ZSH_CUSTOM ]; then
		source $HOME/dotfiles/.zshrc
	fi

	src=$(which {})
	if [ $(echo $src | wc -l | tr -d "[[:space:]]") = 1 ]; then
		src=$(command cat $src)
	else
		cmd={};
		desc=$(rg -F "${cmd}()" --glob $ZSH_CUSTOM/*.zsh -B 5 --no-filename | sed -n "/^# /p" | rev | cut -c2- | rev)
		if [ ! -z $desc ]; then
			src="$desc \n$src"
		fi
	fi

	echo $src | bat --color=always --terminal-width $FZF_PREVIEW_COLUMNS --style=numbers --language zsh
	')

	print -z "${runit} "
}

#########################################
# Open a VSCode project, if             #
# it's set up with Project Manager      #
#########################################
proj() {
	query="$@"

	project=$(jq -r '.[] | [.name, .rootPath] | @tsv' ${HOME}/Library/Application\ Support/Code/User/globalStorage/alefragnani.project-manager/projects.json | \
	rev | \
	cut -d' ' -f1 | \
	rev | \
	cut -c1- | \
	column -t -s $'\t' | \
	fzf --query=$query --prompt=" open --no-multi project: " --preview='file=$(echo {2} | sed "s/~//g" )
	if [ -f $HOME/${file} ]; then file=$(echo -e $(dirname $file)); fi
	exa -1 --icons --long --no-permissions --no-filesize --no-user --tree --level=2 --ignore-glob="node_modules" $HOME/${file}' | \
	sed 's/~//g' | \
	rev | \
	cut -d' ' -f1 | \
	rev )

	if [ ! -z "${project}" ]; then
		project="${HOME}/${project}"

		if [[ "$project" == *"code-workspace"* ]]; then
			cd "$(dirname "$project")" && open -a 'Visual Studio Code' "${project}"
		elif [ -d "${project}" ]; then
			cd "${project}" && code .
		else
			echo "Project not found - ${project}"
		fi
	fi
}
