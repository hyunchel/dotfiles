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
    ## Temporary
    alias sshAirflow="ssh -i ~/.ssh/airflow.pem ubuntu@$REX_AIRFLOW_IP"
    alias pgProd="pgcli -h $REX_POSTGRES_PROD -U rexuser -d hummingbird"
    alias pgQa="pgcli -h $REX_POSTGRES_QA -U rexuser -d hummingbird"
    alias msProd="mycli -h $REX_MYSQL_PROD -u $REX_RDS_USER -p $REX_RDS_PROD_PASSWORD -D rex_db"
    alias msQa="mycli -h $REX_MYSQL_QA -u $REX_RDS_USER -p $REX_RDS_QA_PASSWORD -D rex_db"
    alias redisProd="redis-cli -h $REX_REDIS_PROD"
    alias redisQa="redis-cli -h $REX_REDIS_QA"
fi

export BITBUCKET_USER=hyunchel
export WORK_USER="hkim"

alias enterKey="/usr/bin/ssh-add -t 28800 ~/.ssh/$WORK_USER"
alias removeKey='/usr/bin/ssh-add -D'
alias startWork="enterKey"
alias stopWork="removeKey"
