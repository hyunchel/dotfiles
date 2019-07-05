# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vi='vim'
alias tmux='TERM=xterm-256color tmux'
alias ll='ls -l'
alias ku="kubectl"


ff() {
    grep -Iinr --color=always --exclude=*~ --exclude='./htmlcov/*' --exclude='.coverage' --exclude='tags' $1 .
}


# Platform specific aliases
if [ "$(uname -s)" = 'Darwin' ]; then
    alias ls='ls -G'
fi

# Custom
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gosrc
export PATH=$PATH:$(go env GOPATH)/bin
export EDITOR=vim

# PS1
. ~/.git-prompt.sh

PS1="\[\033[38;5;218m\]\u\[\033[38;5;15m\]@\[\033[38;5;161m\]\h\[\033[38;5;15m\]:"
export PS1="$PS1\w\[\033[38;5;99m\]\$(__git_ps1 \"(%s)\")\[\033[38;5;120m\]$ \[\033[0m\]"

# Git
. ~/.git-completion.bash

## Python
export PATH=~/miniconda3/bin:$PATH

## Java
export PATH=$PATH:"$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Requires brew to install things

## NVM
if [ -f $(brew --prefix nvm)/nvm.sh ]; then
    . $(brew --prefix nvm)/nvm.sh
    export NVM_DIR=~/.nvm
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Personal
if [ -f ~/.config/hyunchel/env ]; then
    . ~/.config/hyunchel/env
    alias starlight="ssh -i $STARLIGHT_PRIV hyunchel.inbox@$STARLIGHT_IP"
    alias lonleyowl="ssh -i $LONELYOWL_PRIV hyunchel.inbox@$LONELYOWL_IP"
fi

# Work

## And and remove keys from the SSH Agent. Set to 8 hours
if [ -f ~/.config/arah/env.sh ]; then
    . ~/.config/arah/env.sh
fi

if [ -f ~/.config/rex/rex.sh ]; then
    . ~/.config/rex/rex.sh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
