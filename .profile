alias ls='ls -G '
alias ll='ls -la '

export UNAME=`uname`

alias gs='git status'
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
alias simulator_android='/Users/jon/Library/Android/sdk/tools/emulator -netdelay none -netspeed full -avd Nexus_5_API_21_x86'
alias simulator_ipad='xcrun instruments -w "iPad 2 (8.2 Simulator)"'
alias simulator_iphone='xcrun instruments -w "iPhone 6 (8.2 Simulator)"'
alias googleunsafe='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security'

alias gitpairken='export GIT_AUTHOR_NAME="Jon Rogers and Ken Shimizu" GIT_AUTHOR_EMAIL="jon+ken+dev@carbonfive.com"'

PROJECTS=/projects/
[[ -d ~/projects/ ]] && PROJECTS=~/projects/

export GOPATH=${PROJECTS}/goprojects
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/jon/utils:/Users/jon/utils/perl
export PATH=$PATH:/usr/local/mysql/bin:./node_modules/mocha/bin:/usr/local/share/npm/bin

export ANDROID_HOME=${PROJECTS}/android-sdk-macosx/

export PATH="${PROJECTS}/android-sdk-macosx/tools:$PATH"
export PATH="${PROJECTS}/android-sdk-macosx/platform-tools:$PATH"
export PATH="${PROJECTS}/android-sdk-macosx/build-tools/19.0.2:$PATH"

export MANPATH=$MANPATH:/usr/local/man
export PG_USER=jon
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:fg:bg:history'
export PHANTOMJS_BIN=`which phantomjs`

export GOPATH=${PROJECTS}/goprojects

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

whodunit() {
  git ls-tree --name-only -z -r HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain | grep "^author "|sort|uniq -c|sort -nr
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
#\$git_dirty
export PS1="\h:\W \$git_branch (\!)$ "

#if [ -f `which hub` ]; then
  ## alias git='hub'
#fi

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
export MAU=${PROJECTS}/mau
export COG=${PROJECTS}/cognoa
export QR=${PROJECTS}/qr4r
export HAZL=/scratch/eventserver/hazl/
export ROMEY=${PROJECTS}/romeydesigns
export FAUX=${PROJECTS}/fauxtaux_booth
export AM=${PROJECTS}/anson_mills
export E1890=${PROJECTS}/1890web/
export ASIAN=${PROJECTS}/asian 
export AAM=${PROJECTS}/asian 
export SC=${PROJECTS}/selectors_choice
export LT=${PROJECTS}/localtakesf
export MANDIBLE=${PROJECTS}/mandible
export BRESBO=${PROJECTS}/bresbo
export SNAPSHOT=${PROJECTS}/snapshot
export KABLAMMO=${PROJECTS}/kablammo
export BAR=${PROJECTS}/barista
export KO=${PROJECTS}/kohala
export KU=${PROJECTS}/kuju
export HOOD=${PROJECTS}/hood
export SPRY=${PROJECTS}/autodesk-spry
export ACAD=${PROJECTS}/autocad360-web/
export HM=${PROJECTS}/harrison-metal

alias xcode='/Applications/Xcode.app/Contents/MacOS/Xcode'
alias simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

export GIT_SSL_NO_VERIFY=true
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#export RACK_ENV=development

export INCLUDE_PRY=1

# for oracle
export DYLD_LIBRARY_PATH=/usr/local/instantclient_11_2:$DYLD_LIBRARY_PATH


# BEGIN Ruboto setup
[ -f ~/.rubotorc ] && source ~/.rubotorc
# END Ruboto setup

setup_pair() {
  name="$1 & $2"
  em="$1+$2+dev@carbonfive.com"
  em2=`echo ${em// /_}`
  email=`echo $em2 | awk '{print tolower($0)}'`
  echo "export GIT_AUTHOR_NAME=\"$name\""
  export GIT_AUTHOR_NAME=$name
  export GIT_AUTHOR_EMAIL=$email
}
