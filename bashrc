# bash completion!
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# This settings add the Git branch and workon settings to the command prompt

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1="\[\e[01;32m\]\h \[\e[01;33m\]\W \$(parse_git_branch)\[\e[01;33m\]$\[\e[00m\] "
#export PS1="bigml$ "

export NODE_PATH="/usr/local/lib/jsctags/:/usr/local/lib/node:$NODE_PATH"

export PATH=~/bin:/opt/local/bin:~/software/mongodb/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/local/share/npm/bin:/usr/local/mysql/bin:~/software/haxe:$PATH
export VIM_APP_DIR=/Applications/MacVim-7_3-53/
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/latest/Contents/Home/

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#export PYTHONSTARTUP=~/.pythonstartup
export WORKON_HOME=~/.virtualenv
source /usr/local/bin/virtualenvwrapper.sh

function setdsm() {
 # add the current directory and the parent directory to PYTHONPATH
 # sets DJANGO_SETTINGS_MODULE
 export PYTHONPATH=$PYTHONPATH:$PWD/..
 export PYTHONPATH=$PYTHONPATH:$PWD
 if [ -z "$1" ]; then
    x=${PWD/\/[^\/]*\/}
    export DJANGO_SETTINGS_MODULE=$x.settings
 else
    export DJANGO_SETTINGS_MODULE=$1
 fi

 echo "DJANGO_SETTINGS_MODULE set to $DJANGO_SETTINGS_MODULE"
}

export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LS_COLORS="gxfxcxdxbxegedabagacad"
export CVSEDITOR=vim
export EDITOR=vim
#export JAVA_OPTS=-Xmx2500m
export SVN_EDITOR=vim
export GIT_EDITOR=vim
