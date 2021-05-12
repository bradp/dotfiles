#!/usr/bin/env zsh

# This is what the prompt will look like (with colors)
# ~/this-is-some/directory
# (master ✔ ) ▲ <type commands here>
#
# The git integration only shows if in a git directory.
#
# Clean/dirty status is a simple check or x mark.
# Clean:          (<git branch> ✔ ) ▲
# Dirty:          (<git branch> ✘ ) ▲
#
# When dirty, helpful icons show what is changed.
# Modified files: (<git branch> ✘ )✹ ▲
# Deleted files:  (<git branch> ✘ )✖ ▲
# Added files:    (<git branch> ✘ )✭ ▲
# All the above:  (<git branch> ✘ )✖✹✭ ▲

# Allows command substitution in our prompt.
setopt promptsubst

# Autoload all the hooks.
autoload -U add-zsh-hook

# Define our colors.
# If you wish to change these, you can run 'spectrum_ls' to get a list.
PROMPT_PATH_COLOR=$FG[117] # Cyan
PROMPT_PROMPT=$FG[077]     # Greenish cyan
GIT_DIRTY_COLOR=$FG[133]   # Pinkish red
GIT_CLEAN_COLOR=$FG[118]   # Green
GIT_PROMPT_INFO=$FG[012]   # Blue

# Define our prompt parts.
ZSH_THEME_GIT_PROMPT_PREFIX="("                      # Git info is in parens.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%} )" # All ends with parens, too.

# Git prompt symbols for status. Modify to your liking.
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
# Clean:     ✔
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"
# Added:     ✚
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
# Modified:  ✹
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
# Deleted:   ✖
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
# Renamed:   ➜
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
# Unmerged:  ═
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
# Untracked: ✭
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

# Build up our prompt.
PROMPT='%{$PROMPT_PATH_COLOR%}%~%{$reset_color%} %{$GIT_PROMPT_INFO%}
$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}▲ %{$reset_color%}'
RPROMPT="%{$FG[239]%}% $(date +"%a, %b %d - %H:%M") - $(battery)% %{$reset_color%}"
