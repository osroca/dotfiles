# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Git Autocompletion
source ~/.git-completion.bash

# Git
alias gco='git co'
alias gci='git ci'
alias grb='git rb'

# Roo & maven
PATH=$PATH:~/software/java/spring-roo-2.0.0.M1/bin
#PATH=$PATH:~/software/java/gvNIX-1.4.1.RELEASE/bin

# SVN
PATH=/opt/subversion/bin:$PATH

#TextMate
PATH=$PATH:/Applications/TextMate.app/Contents/MacOS

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

#export CLICOLOR=0
#export LSCOLORS=ExFxCxDxBxegedabagacad
#export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

export GREP_COLORS='1;35'
alias grep='grep --color=auto'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

alias bfg='java -jar ~/bfg-1.12.7.jar'
