switch-php() {
	brew ls --versions | grep --extended-regexp 'php(@.*)?\s' | grep --extended-regexp --only-matching ' (\d.\d)' | sort | uniq | while read -r line ; do
		if [ -z "${1}" ]; then
			echo "php${line}"
		fi
		
		exists=$(alias | grep "php${line}")
		if [ -z "${exists}" ]; then
			alias "php${line}"="brew link php@${line} --force --overwrite"
		fi
	done

	if [ ! -z "${1}" ]; then
		brew link php@${1} --force --overwrite
	fi
}
