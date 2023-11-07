export ZSH="$HOME/.oh-my-zsh"
export ZSH_PRIVATE="$HOME/.zshrc.private"

ZSH_THEME="norm"
ZSH_DISABLE_COMPFIX="true"
DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

autoload -U zmv
autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

plugins=(
  git
  macos
  colorize
  zsh-autosuggestions
  asdf
)

source $ZSH/oh-my-zsh.sh
source $ZSH_PRIVATE

# Editor Defaults
export EDITOR='nvim'
alias vim='nvim'

# System
alias ..='cd ..'
alias lsa='ls -lah'
alias l="ls -laHF"
alias ll='ls -l'
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias rm="nocorrect rm"       # no spelling correction on rm
alias o="open ."

# Git
alias gti="git"
alias g='git'
alias gs='git status -sb'
alias gl='git log' 
alias ga='git add' 
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gm='git commit --amend'
alias gb='git branch'
alias gbn='git checkout -b'
alias gd='clear && git diff'
alias gdm='git diff | mvim -'
alias gll='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gp='git fetch --prune'
alias gt='git_types'
alias ggpull="git pull"
alias ggpush="git push"

git_rm_local_branches() {
  git for-each-ref --format '%(refname:short)' refs/heads | grep -v "master\|main" | xargs git branch -D
}

# Git Helper Functions
branch () { gco -b "$@" }
remote () { gco -b "$@" origin/"$@" }
rename () { gb -m "$@" }

# Docker
alias dc="docker-compose"
alias dcr="docker-compose run"

# Additional PATHs
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/Users/daedalus/.local/bin:$PATH
export PATH=$PATH:$GOPATH/bin

# ASDF
. "$HOME/.asdf/asdf.sh"
. ~/.asdf/plugins/golang/set-env.zsh

cat << "EOF"
   __     __
  /_/|   |\_\
   |U|___|U|
   |       |
   | ,   , |
  (  = Y =  )
   |   `   |
  /|       |\
  \| |   | |/
 (_|_|___|_|_)
   '"'   '"'
EOF
