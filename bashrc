# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vi='vim'
alias ll='ls -l'
alias ku="kubectl"


# Platform specific aliases
if [ "$(uname -s)" = 'Darwin' ]; then
    alias ls='ls -G'
fi


# Custom GOPATH
export GOPATH=$HOME/Development/golang
export PATH=$PATH:$(go env GOPATH)/bin


# Requires brew to install things.

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


# Work

# And and remove keys from the SSH Agent. Set to 8 hours.
export BITBUCKET_USER=hyunchel
export WORK_USER="hkim"

alias enterKey="/usr/bin/ssh-add -t 28800 ~/.ssh/$WORK_USER"
alias removeKey='/usr/bin/ssh-add -D'
alias startWork="enterKey"
alias stopWork="removeKey"

