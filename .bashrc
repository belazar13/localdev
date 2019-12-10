source ~/.git-prompt.sh

PS1="\[\e]0;\u@\h \w\a\]\[\033[01;34m\]\w\[\033[00m\] \$ "
PS1="\[\033[0;33m\]\t \$(__git_ps1)$PS1"

export GIT_MERGE_AUTOEDIT=no
umask 002

export HISTCONTROL=ignoreboth:erasedups
