export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias cl=clear
alias vi=vim
alias ls="ls -Alh"
alias wip="git add -A . && git commit -m 'wip'"
alias nrt="npm run test"

function recreatedb() {
  dropdb $1 && createdb $1
}

export PATH=/usr/local/bin:${PATH}:~/.local/bin:~/bin
