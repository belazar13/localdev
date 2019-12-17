# localdev

## ~/.bashrc

### general user

PS1="\[\e]0;\u@\h \w\a\]\[\033[01;34m\]\w\[\033[00m\] \$ "
PS1="\[\033[0;33m\]\t\n\$(__git_ps1)$PS1"

### root user

#### *buntu
PS1="\[\e]0;\u@\h: \w\a\]\[\033[0;33m\]\t\n\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ "

#### Mint
PS1="\[\e]0;\u@\h: \w\a\]\[\033[0;33m\]\t\n\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $ "

### Special magic to led keyboard - Defender Nova SM-690L(45690)
xset led named "Scroll Lock"
