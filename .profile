# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH=/opt/local/bin:/opt/local/sbin$PATH

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export CATALINA_OPTS="-Xmx1024m -XX:MaxPermSize=512m"

############## Aliases ##################
alias grep='grep --color'
alias man='LC_ALL=C LANG=C man'
alias ls='ls -lh'
alias prep='ps -ef | grep'

alias ip='ifconfig | grep "inet 10" | cut -f 2 -d " "'

# Only for Unix (to imitate mac stuff)
#if [[`uname` != "Darwin"]]; then
#  alias pbcopy='xclip -selection clipboard'
#  alias pbpaste='xclip -selection clipboard -o'
#fi

# Goodreads
alias gr='cd ~/goodreads/goodreads_rails/ng-root'
export GOODREADS_DEV_EMAIL=`whoami`@goodreads.com
alias ss='./script/server'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
