alias ls='ls -G '
alias ll='ls -la '

export UNAME=`uname`

alias ed='emacs --daemon'
alias ec='emacsclient -c -a=""'
alias killemacs="emacsclient -e '(kill-emacs)'"

alias gs='git status'
alias pd="pushd"
alias pop="popd"
alias lookfor="history | grep"
alias js="java -jar ~/utils/rhino/js.jar"
alias svnchanged='svn status | egrep "^\ M\ |^M\ " |  cut -c8-'
alias jslint="jsl -process"
alias be=''
alias bi='bundle install '
alias bu='bundle update '
alias serveit='python -m SimpleHTTPServer '
alias servit='serveit'
alias simulator_android='/Users/jon/Library/Android/sdk/tools/emulator -netdelay none -netspeed full -avd Nexus_5_API_21_x86'
alias simulator_ipad='xcrun instruments -w "iPad Air 2"'
alias simulator_iphone='xcrun instruments -w "iPhone 6s Plus"'
alias googleunsafe='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security'

foremandev() {
    foreman "$1" -f Procfile.dev
}

PROJECTS=/projects/
[[ -d ~/projects/ ]] && PROJECTS=~/projects/

eval "$(rbenv init -)"

export GOPATH=${PROJECTS}/goprojects
export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/jon/utils:/Users/jon/utils/perl
export PATH=./.git/safe/../../bin/:./.git/safe/../../node_modules/.bin/:${PATH}
export PATH="$(brew --prefix qt@5.7)/bin:${PATH}"
export PATH=$PATH:/usr/local/opt/qt@5.5/bin
export PATH=$PATH:~/.mix/escripts/


export ANDROID_HOME=${PROJECTS}/android-sdk-macosx/

export PATH="${PROJECTS}/android-sdk-macosx/tools:$PATH"
export PATH="${PROJECTS}/android-sdk-macosx/platform-tools:$PATH"
export PATH="${PROJECTS}/android-sdk-macosx/build-tools/19.0.2:$PATH"

export MANPATH=$MANPATH:/usr/local/man
#export PG_USER=jon
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:fg:bg:history'
export PHANTOMJS_BIN=`which phantomjs`

export GOPATH=${PROJECTS}/goprojects


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

sourceit() {
    f=$1
    [ -f $f ] && source $f
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
#\$git_dirty
export PS1="\h:\W \$git_branch (\!)$ "

#if [ -f `which hub` ]; then
## alias git='hub'
#fi

sourceit /usr/local/etc/bash_completion

for script in ~/bash_completions/completion-*[^~]; do
    sourceit $script
done

sourceit /usr/local/git/contrib/completion/git-completion.bash
sourceit /usr/local/etc/bash_completion.d/git-completion.bash

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
export SC=${PROJECTS}/selectorschoice
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
export PATENT=${PROJECTS}/patent-scraper
export GLUEBOT=${PROJECTS}/gluebot
export HABIT=${PROJECTS}/papaya
export PAPAYA=${PROJECTS}/papaya
export MANGO=${PROJECTS}/mango
export SEARCHER=${PROJECTS}/elasticsearcher
export NEON=${PROJECTS}/tr/1p-frontend-new/1p-frontend-webapp
export TRWEB=${PROJECTS}/tr/tr-webui
export TIMESHEET=${PROJECTS}/timesheet
export ALLOCATIONS=${PROJECTS}/allocations
export CTA=${PROJECTS}/cta
export SP=${PROJECTS}/sharespost/sharex

export GAP=${PROJECTS}/gap
export TISVC=${GAP}/target-inventory-service
export APSVC=${GAP}/allocation-fulfillment-service
export AWEB=${GAP}/allocation-web
export CATSVC=${GAP}/allocation-catalog-service
export BOOK=${GAP}/booking-manager
export BOOKUI=${GAP}/booking-manager-ui
export NETPERF=${PROJECTS}/net_performance_monitor


alias xcode='/Applications/Xcode.app/Contents/MacOS/Xcode'
#alias simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

export GIT_SSL_NO_VERIFY=true

export INCLUDE_PRY=1

export JAVA_HOME=`/usr/libexec/java_home`
# for oracle
export DYLD_LIBRARY_PATH=/usr/local/instantclient_11_2:$DYLD_LIBRARY_PATH


# BEGIN Ruboto setup
sourceit ~/.rubotorc
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

alias gw='./gradlew'

export CLASSPATH=$CLASSPATH:~/Downloads/db2jcc.jar
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export PATH=${PATH}:~/Library/Python/3.6/bin/
