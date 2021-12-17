export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export DEFAULT_USER=`whoami`

alias cl=clear
alias vi=vim
alias ls="ls -Alh"
alias cra="create-react-app"
alias glow="glow -p"
alias p="pnpm"
alias pb="p bootstrap"
alias ys="p start"
alias boot="p bootstrap && p migrate && p start"

# git r done
alias pull="git fetch -p && git pull"
alias reb="git fetch -p && git rebase origin/master"
alias gcp="git checkout -p ."
alias gls="git log --stat"
alias gstash="git stash save --keep-index"

export GIT_REMOTE_BRANCH_PREFIX="BDP"

function gP {
  local short_name=`git rev-parse --abbrev-ref HEAD`
  local prefix="${GIT_REMOTE_BRANCH_PREFIX:-`whoami`}"
  if [[ $current_branch == *"${prefix}"* ]]; then
    local full_name="${short_name}"
  else
    local full_name="${prefix}/${short_name}"
  fi
  gp ${@} origin HEAD:${full_name} --force
}

# Place any confidential aliases in this file
[[ -f ~/.profile.private ]] && source ~/.profile.private

export LESS="-F -X -R ${LESS}"
export EDITOR=vim
export NODE_REPL_HISTORY=~/.node-repl-history.log

function recreatedb() {
  dropdb --if-exists $1 && createdb $1
}

export PATH=/usr/local/bin:/usr/local/opt/openjdk/bin:${PATH}:~/.local/bin:~/dotfiles/bin

# For installing with rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# nvm
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
