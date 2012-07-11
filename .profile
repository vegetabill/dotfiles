# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

############## Aliases ##################
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias grep='grep --color'
alias man='LC_ALL=C LANG=C man'
alias ls='ls -lh'
alias prep='ps -ef | grep'
alias mingle='cd ~/studios/mingle'
alias support='cd ~/studios/support'
alias jss='./script/jruby_mingle_server'
alias ss='./script/server'
alias ssh='ssh -l wdephill'
alias ass='mkdir -p tmp; rake asset:packager:build_all'
function recreatedb() { dropdb "$*" && createdb "$*" }
alias ip='ifconfig | grep "inet 10" | cut -f 2 -d " "'
