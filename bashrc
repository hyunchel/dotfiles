# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vi='vim'
alias tmux='TERM=xterm-256color tmux'
alias ll='ls -l'
alias ku="kubectl"


ff() {
    grep -Iinr --color=always --exclude=*~ $1 .
}


# Platform specific aliases

if [ "$(uname -s)" = 'Darwin' ]; then
    alias ls='ls -G'
fi


# Custom
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gosrc
export PATH=$PATH:$(go env GOPATH)/bin
export EDITOR=vim

## Python
export PATH=~/miniconda3/bin:$PATH


# Requires brew to install things

## NVM
if [ -f $(brew --prefix nvm)/nvm.sh ]; then
    . $(brew --prefix nvm)/nvm.sh
    export NVM_DIR=~/.nvm
fi

# Personal
if [ -f ~/.config/hyunchel/env ]; then
    . ~/.config/hyunchel/env
    alias starlight="ssh -i $STARLIGHT_PEM ec2-user@$STARLIGHT_IP"
fi

# Work

## And and remove keys from the SSH Agent. Set to 8 hours
if [ -f ~/.config/rex/rex.sh ]; then
    . ~/.config/rex/rex.sh
fi
