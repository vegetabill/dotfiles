export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export DEFAULT_USER=`whoami`

alias cl=clear
alias vi=vim
alias ls="ls -Alh"
alias wip="git add -A . && git commit --no-verify -m 'wip'"
alias nrt="npm run test"
alias cra="create-react-app"

export EDITOR=vim

function recreatedb() {
  dropdb --if-exists $1 && createdb $1
}

export PATH=/usr/local/bin:/usr/local/opt/openjdk/bin:${PATH}:~/.local/bin:~/dotfiles/bin

# For installing with rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# nvm
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

eval "$(pyenv init -)"