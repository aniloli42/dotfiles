# Listing Aliases
alias ll='ls -alF'
alias l='ls -a'
alias rf='rm -rf'

alias c='clear'

# nvim
alias nv='nvim -d'
alias nvc="nvim ."

# Git Aliases
alias gs='git status'
alias gc='git commit -m'
alias gcan="git commit --amend --no-edit"
alias gsc='git commit -S -m'
alias gl='git log'
alias g1='git log --oneline'
alias gf='git fetch --all'
alias gp='git pull'
alias ga='git add'
alias gaa='git add -A'
alias gb='git reset HEAD^'
alias gpo='git push origin "$(git branch --show-current)"'

# Bash
alias sb="source ~/.bashrc"

# Montior Conf
alias mconf="xrandr --output eDP-1 --mode 1920x1080 --rate 60 --primary --output HDMI-1 --mode 1920x1080 --rate 75 --left-of eDP-1"

# Docker
alias d="docker"
alias di="docker images"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dc="docker-compose"
alias dcb="docker-compose build"
alias dcd="docker-compose down"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
