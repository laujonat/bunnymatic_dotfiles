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
alias serveit='python -m SimpleHTTPServer '

export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/jon/utils:/Users/jon/utils/perl:~/.rvm/bin
export PATH=/Applications/Emacs.app/Contents/MacOS:$PATH
export PATH=$PATH:/usr/local/mysql/bin:./node_modules/mocha/bin:/usr/local/share/npm/bin
export MANPATH=$MANPATH:/usr/local/man

eval "$(rbenv init -)"

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='*'
  else
    git_dirty=''
  fi
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
#\$git_dirty
export PS1="\h:\W \$git_branch (\!)$ "


if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [ -d ~/bash_completions/ ]; then
  # regex here is to exclude emacs tmp files
  for script in ~/bash_completions/completion-*[^~]; do
    . $script
  done
fi

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    . /usr/local/git/contrib/completion/git-completion.bash 
fi
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash 
fi

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
export ASIAN=/projects/asian 
export AAM=/projects/asian 
export SC=/projects/selectors_choice
export LT=/projects/localtakesf
export LEAP=/projects/leap
export LEAPDEV=$LEAP/leapdev
export CENTRAL=$LEAP/central
export LEAPAUTH=$LEAP/leapauth_helper

export MANDIBLE=/projects/mandible

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then 
   . "$HOME/.rvm/scripts/rvm"
fi
alias @mau='cd $MAU'
alias @hazl='cd $HAZL'

alias git-svn='git svn'

alias xcode='/Applications/Xcode.app/Contents/MacOS/Xcode'

export GIT_SSL_NO_VERIFY=true
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

export WUFOO_API_KEY=V8H5-MUJW-KV8U-3LTW

export RACK_ENV=development

export INCLUDE_PRY=1
