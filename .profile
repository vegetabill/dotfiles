# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH=/opt/local/bin:/opt/local/sbin$PATH

############## Aliases ##################
alias grep='grep --color'
alias ls='ls -lh'
alias prep='ps -ef | grep'

alias ip='ifconfig | grep "inet 10" | cut -f 2 -d " "'

# Goodreads
alias gr='cd ~/goodreads/goodreads_rails/ng-root'
export GOODREADS_DEV_EMAIL=`whoami`@goodreads.com
alias ss='./script/server'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
