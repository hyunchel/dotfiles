# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vi='vim'
alias tmux='TERM=xterm-256color tmux'
alias ll='ls -l'

# Custom
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gosrc
export PATH=$PATH:$(go env GOPATH)/bin
export EDITOR=vim

## Python
export PATH=~/miniconda3/bin:$PATH
conda init zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Personal
if [ -f ~/.config/hyunchel/env ]; then
    . ~/.config/hyunchel/env
    alias starlight="ssh -i $STARLIGHT_PRIV hyunchel.inbox@$STARLIGHT_IP"
    alias lonelyowl="ssh -i $LONELYOWL_PRIV hyunchel.inbox@$LONELYOWL_IP"
fi

# Work

## And and remove keys from the SSH Agent. Set to 8 hours
if [ -f ~/.config/arah/env.sh ]; then
    . ~/.config/arah/env.sh
fi

if [ -f ~/.config/rexhomes/rex.sh ]; then
    . ~/.config/rexhomes/rex.sh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Platform specific aliases
if [ "$(uname -s)" = 'Darwin' ]; then
    alias ls='ls -G'

    # kube-ps1
    source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
    PS1='$(kube_ps1)'$PS1

    # k8s
    source <(kubectl completion bash)
    source ~/bin/functions/*

    ## Java
    export PATH=$PATH:"$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"

    # Requires brew to install things

    ## NVM
    if [ -f $(brew --prefix nvm)/nvm.sh ]; then
        . $(brew --prefix nvm)/nvm.sh
        export NVM_DIR=~/.nvm
    fi
fi
