export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export DEFAULT_USER=`whoami`

alias cl=clear
alias vi=vim
alias ls="ls -Alh"
alias wip="git add -A . && git commit -m 'wip'"
alias nrt="npm run test"

export EDITOR=vim

function recreatedb() {
  dropdb $1 && createdb $1
}

export PATH=/usr/local/bin:${PATH}:~/.local/bin:~/bin
