#!/usr/bin/env zsh
setopt promptsubst # Allows command substitution.
autoload -U add-zsh-hook # Autoload hooks.
setopt extended_glob

ZSH_THEME_GIT_PROMPT_PREFIX="שׂ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[118]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=''
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$FG[133]%}ﰵ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$FG[133]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_REMOTE_MISSING="%{$FG[193]%} %{$reset_color%}"
PARBS_GIT_PROMPT_SHOW_UNTRACKED=${PARBS_GIT_PROMPT_SHOW_UNTRACKED:-false}

typeset -g PARBS_GIT_INFO=""

__parbs_git() {
	GIT_OPTIONAL_LOCKS=0 command git "$@"
}

__append_git_prompt_symbol() {
	local symbol="$1"
	[[ -n "$symbol" ]] || return
	printf '%s' "$symbol"
}

__refresh_git_info() {
	local status_output line ref oid upstream ahead behind
	local xy index_state worktree_state
	local has_added has_modified has_deleted has_renamed has_unmerged has_untracked has_stashed has_changes
	local prompt_segment=""
	local -a git_status_args fields ab_fields

	git_status_args=(status --porcelain=v2 --branch --ignore-submodules=dirty)

	if [[ "$PARBS_GIT_PROMPT_SHOW_UNTRACKED" == "true" ]]; then
		git_status_args+=(--untracked-files=normal)
	else
		git_status_args+=(--untracked-files=no)
	fi

	status_output="$(__parbs_git "${git_status_args[@]}" 2>/dev/null)" || {
		PARBS_GIT_INFO=""
		return
	}

	while IFS= read -r line; do
		case "$line" in
			"# branch.head "*)
				ref="${line#\# branch.head }"
				;;
			"# branch.oid "*)
				oid="${line#\# branch.oid }"
				;;
			"# branch.upstream "*)
				upstream="${line#\# branch.upstream }"
				;;
			"# branch.ab "*)
				ab_fields=(${=line#\# branch.ab })
				ahead=${ab_fields[1]#+}
				behind=${ab_fields[2]#-}
				;;
			"1 "*|"2 "*)
				fields=(${(s: :)line})
				xy="${fields[2]}"
				index_state="${xy[1]}"
				worktree_state="${xy[2]}"

				case "$index_state" in
					A) has_added=1 ;;
					M|T) has_modified=1 ;;
					D) has_deleted=1 ;;
					R|C) has_renamed=1 ;;
					U) has_unmerged=1 ;;
				esac

				case "$worktree_state" in
					M|T) has_modified=1 ;;
					D) has_deleted=1 ;;
					U) has_unmerged=1 ;;
				esac
				;;
			"u "*)
				has_unmerged=1
				;;
			"? "*)
				has_untracked=1
				;;
		esac
	done <<< "$status_output"

	if [[ "$ref" == "(detached)" && -n "$oid" ]]; then
		ref="${oid[1,7]}"
	fi

	if [[ -z "$ref" ]]; then
		PARBS_GIT_INFO=""
		return
	fi

	prompt_segment="${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}"

	if __parbs_git rev-parse --verify refs/stash &>/dev/null; then
		has_stashed=1
	fi

	if (( ${ahead:-0} > 0 && ${behind:-0} > 0 )); then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_DIVERGED}")"
		has_changes=1
	elif (( ${behind:-0} > 0 )); then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_BEHIND}")"
		has_changes=1
	elif (( ${ahead:-0} > 0 )); then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_AHEAD}")"
		has_changes=1
	fi

	if [[ -n "$has_unmerged" ]]; then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_UNMERGED}")"
		has_changes=1
	fi

	if [[ -n "$has_stashed" ]]; then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_STASHED}")"
		has_changes=1
	fi

	if [[ -n "$has_deleted" ]]; then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_DELETED}")"
		has_changes=1
	fi

	if [[ -n "$has_renamed" ]]; then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_RENAMED}")"
		has_changes=1
	fi

	if [[ -n "$has_modified" ]]; then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_MODIFIED}")"
		has_changes=1
	fi

	if [[ -n "$has_added" ]]; then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_ADDED}")"
		has_changes=1
	fi

	if [[ -n "$has_untracked" ]]; then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_UNTRACKED}")"
		has_changes=1
	fi

	if [[ -z "$has_changes" ]]; then
		prompt_segment+="$(__append_git_prompt_symbol "${ZSH_THEME_GIT_PROMPT_CLEAN}")"
	fi

	PARBS_GIT_INFO="%{$FG[012]%}${prompt_segment}${ZSH_THEME_GIT_PROMPT_SUFFIX}%{$reset_color%}"
}

add-zsh-hook precmd __refresh_git_info
add-zsh-hook chpwd __refresh_git_info
__refresh_git_info

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
	echo "$PARBS_GIT_INFO"
}

__prompt_color() {
	echo "%{%(?.%{$FG[082]%}.%{$FG[196]%})%}"
}

__() {
	echo ""
}

PROMPT='$(__prompt_path) %{$reset_color%}
$(__git_info)$(__remote_host)$(__prompt_color)△ %{$reset_color%}'
RPROMPT=""
PS2='%{$FG[246]%}↳  %{$reset_color%}'
