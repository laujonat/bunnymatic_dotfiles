export PS1="\h:\W (\!)$ "

alias ll='ls -la '

export UNAME=`uname`

alias pd="pushd"
alias pop="popd"
alias lookfor="history | grep"
alias js="java -jar ~/utils/rhino/js.jar"
alias svnchanged='svn status | egrep "^\ M\ |^M\ " |  cut -c8-'
alias jslint="jsl -process"
alias be='bundle exec '
alias ber='bundle exec rake'
alias bi='bundle install '
alias bu='bundle update '

#export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/jon/utils/:/Users/jon/utils/perl:~/.rvm/bin
export PATH=/Applications/Emacs.app/Contents/MacOS:$PATH
export PATH=$PATH:/usr/local/mysql/bin
export MANPATH=$MANPATH:/usr/local/man

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi
if [ -d ~/bash_completions/ ]; then
  if [ -f ~/bash_completions/completion-ruby-all ]; then 
    . ~/bash_completions/completion-ruby-all
  fi
fi
#if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
#    . /usr/local/git/contrib/completion/git-completion.bash 
#fi

export PYTHONPATH=/usr/local/lib/python2.5/site-packages

export EDITOR=/usr/bin/vi
#export SVNROOT=svn+ssh://svn.bunnymatic.com/space/svnroot
export MAU=/projects/mau
export QR=/projects/qr4r
export HAZL=/scratch/eventserver/hazl/
#export MAUREPO=$SVNROOT/mau/web/
export ROMEY=/projects/romeydesigns
export FAUX=/projects/fauxtaux_booth
export AM=/projects/anson_mills
export E1890=/projects/1890web/

export HAZL=/scratch/eventserver/hazl

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then 
   . "$HOME/.rvm/scripts/rvm"
fi
alias @mau='cd $MAU'
alias @hazl='cd $HAZL'

alias git-svn='git svn'
export GIT_SSL_NO_VERIFY=true
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
