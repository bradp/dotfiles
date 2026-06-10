#   ██                      ██      ██               ██
#  ░██              ██   ██░██     ░░               ░██
#  ░██  ██  █████  ░░██ ██ ░██      ██ ███████      ░██  ██████
#  ░██ ██  ██░░░██  ░░███  ░██████ ░██░░██░░░██  ██████ ██░░░░
#  ░████  ░███████   ░██   ░██░░░██░██ ░██  ░██ ██░░░██░░█████
#  ░██░██ ░██░░░░    ██    ░██  ░██░██ ░██  ░██░██  ░██ ░░░░░██
#  ░██░░██░░██████  ██     ░██████ ░██ ███  ░██░░██████ ██████
#  ░░  ░░  ░░░░░░  ░░      ░░░░░   ░░ ░░░   ░░  ░░░░░░ ░░░░░░
#

# ctrl + l → ls
bindkey -s '^l' 'eza -Flam --git --color-scale --icons^M'

# ctrl + s → g status
bindkey -s '^s' 'git status^M'

# ctrl + a → git commit
bindkey -s '^a' 'git commit -m "'

# ctrl + g → git diff
bindkey -s '^g' 'git diff^M'

# ctrl + u → bun run build
bindkey -s '^u' 'bun run build^M'

# ctrl + p → git push current branch
bindkey -s '^p' 'gpob^M'
