# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/opt/local/lib/postgresql84/bin:$PATH

export PGDATA=~/Applications/postgres-data

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

############## Aliases ##################
alias grep='grep --color'
alias man='LC_ALL=C LANG=C man'
alias ls='ls -lh'
alias prep='ps -ef | grep'

function recreatedb() { dropdb "$*" && createdb "$*" }
alias ip='ifconfig | grep "inet 10" | cut -f 2 -d " "'

# Only for Unix (to imitate mac stuff)
# if [[`uname` != "Darwin"]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
# fi

# Only for Mac
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Mingle
alias mingle='cd ~/studios/mingle'
alias support='cd ~/studios/support'
alias jss='./script/jruby_mingle_server'
alias ss='./script/server'
alias ssh='ssh -l wdephill'
alias ass='mkdir -p tmp; rake asset:packager:compile_and_build_all'

