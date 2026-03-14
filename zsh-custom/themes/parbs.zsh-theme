#!/usr/bin/env zsh
setopt promptsubst # Allows command substitution.
autoload -U add-zsh-hook # Autoload hooks.
setopt extended_glob

ZSH_THEME_GIT_PROMPT_PREFIX="שׂ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[118]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=''
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$FG[133]%}ﰵ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$FG[133]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_REMOTE_MISSING="%{$FG[193]%}  %{$reset_color%}"

# Show battery icon
__battery_icon() {
	return

	if ! hash pmset 2>/dev/null; then
		return
	fi

	local batt
	local percent
	local charge
	local display

	batt=($(echo "$(pmset -g batt)" | tr '	' '\n'))
	percent=${"${batt[8]}"//\%\;/}
	charge=${"${batt[9]}"//\;/}

	if [ "$percent" -le "10" ]; then
		display="%{$FG[088]%} %{$reset_color%}"
	elif [ "$percent" -le "20" ]; then
		display="%{$FG[088]%} %{$reset_color%}"
	elif [ "$percent" -le "50" ]; then
		display="%{$FG[228]%} %{$reset_color%}"
	elif [ "$percent" -le "90" ]; then
		display="%{$FG[065]%} %{$reset_color%}"
	else
		display=""
	fi

	if [[ "$charge" = "AC" ]]; then
		echo "${display}"
	elif [[ "$charge" = "charging" ]]; then
		echo "%{$FG[042]%}%{$reset_color%}${display}"
	else
		if [ "$percent" -le "50" ]; then
			echo "%{$FG[088]%} %{$reset_color%}${display}"
		else
			echo "${display}"
		fi
	fi
}

__internet_icon() {
	no_connection="%{$FG[088]%}睊 %{$reset_color%}"

	if [ ! -f /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport ]; then
		if [[ -z $(timeout 0.01 ping -c 1 -s 56 8.8.8.8 2> /dev/null ) ]]; then
			echo "$no_connection"
		fi
	fi

	if [ -z $(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F' SSID: '  '/ SSID: / { print $2 }') ]; then
		echo "$no_connection"
	fi
}

__write_protected_icon() {
	if [[ ! -w . ]]; then
		echo "%{$FG[186]%} %{$reset_color%}"
  	fi
}

__file_icon() {
	local display

	if [[ -f package.json || -d node_modules || -n ./*.js(#qN^/) ]]; then
		js_icon="%{$FG[070]%}  "

		pkgjson=$(jq -r '.version' package.json 2>/dev/null)

		if [[ "$pkgjson" != "null" && "$pkgjson" != "" ]]; then
			js_icon="${js_icon}%{$FG[250]%}${pkgjson} "
		fi

		display="${display}${js_icon}"
	fi

	if [[ -f composer.json || -n ./*.php(#qN^/) ]]; then
		php_icon="%{$FG[104]%}  "

		if [[ -f composer.json ]]; then
			composer_ver=$(jq -r '.version' composer.json 2>/dev/null)

			if [[ "$composer_ver" != "null" ]]; then
				php_icon="${php_icon}%{$FG[250]%}${composer_ver} "
			fi
		fi

		display="${display}${php_icon}"
	fi

	echo "${display}"
}

__icons() {
	if [[ $HOME == ${PWD}] ]]; then
		return
	fi

	local display_icons

	icons=$(__file_icon)

	if [[ "$icons" != "" ]]; then
		display_icons="%{$FG[236]%}  %{$reset_color%}%{$BG[236]%}$(__file_icon) %{$reset_color%}%{$FG[236]%} %{$reset_color%}"

	fi

	echo "$(__write_protected_icon) ${display_icons}"
}

__remote_host() {
	if [[ -n $SSH_CONNECTION ]]; then
		echo "%{$FG[magenta]%}%n%{$reset_color%}@%{$FG[green]%}%m%{$reset_color%}"
	fi
}

__prompt_path() {
	echo "%{$FG[117]%}%~%{$reset_color%}"
}

__git_remote_warning() {
	return
	if __git_prompt_git rev-parse --max-count=1 --git-dir &> /dev/null; then
		echo "$(git_prompt_remote) "
	fi
}

__git_info() {
	echo "%{$FG[012]%}$(git_prompt_info)$(__git_remote_warning)$(git_prompt_status)%{$reset_color%}"
}

__prompt_color() {
	echo "%{%(?.%{$FG[082]%}.%{$FG[196]%})%}"
}

__() {
	echo ""
}

PROMPT='$(__prompt_path) %{$reset_color%}
$(__git_info)$(__remote_host)$(__prompt_color)△  %{$reset_color%}'
RPROMPT="$(__battery_icon)"
PS2='%{$FG[246]%}↳  %{$reset_color%}'
