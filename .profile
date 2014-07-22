alias ll='ls -la '

export UNAME=`uname`

alias exercism='~/exercism/exercism'
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
alias servit='serveit'
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2'

export GOPATH=/projects/goprojects
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/jon/utils:/Users/jon/utils/perl
export PATH=$PATH:/usr/local/mysql/bin:./node_modules/mocha/bin:/usr/local/share/npm/bin

export ANDROID_HOME=/projects/android-sdk-macosx/

export PATH="/projects/android-sdk-macosx/tools:$PATH"
export PATH="/projects/android-sdk-macosx/platform-tools:$PATH"
export PATH="/projects/android-sdk-macosx/build-tools/19.0.2:$PATH"

export MANPATH=$MANPATH:/usr/local/man
export PG_USER=jon
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:fg:bg:history'

eval "$(rbenv init -)"

smbip() {
  smbutil lookup $1 | head -1 | ruby -nle 'puts $_.split.last;'
}

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

if [ -f `which hub` ]; then
  alias git='hub'
fi

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
export MAU=/projects/mau
export QR=/projects/qr4r
export HAZL=/scratch/eventserver/hazl/
export ROMEY=/projects/romeydesigns
export FAUX=/projects/fauxtaux_booth
export AM=/projects/anson_mills
export E1890=/projects/1890web/
export ASIAN=/projects/asian 
export AAM=/projects/asian 
export SC=/projects/selectors_choice
export LT=/projects/localtakesf
export MANDIBLE=/projects/mandible
export BRESBO=/projects/bresbo
export SNAPSHOT=/projects/snapshot
export KABLAMMO=/projects/kablammo
export BAR=/projects/barista

alias xcode='/Applications/Xcode.app/Contents/MacOS/Xcode'
alias simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

export GIT_SSL_NO_VERIFY=true
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export RACK_ENV=development

export INCLUDE_PRY=1

# for oracle
export DYLD_LIBRARY_PATH=/usr/local/instantclient_11_2:$DYLD_LIBRARY_PATH


# BEGIN Ruboto setup
[ -f ~/.rubotorc ] && source ~/.rubotorc
# END Ruboto setup

