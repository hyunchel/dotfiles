# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vi='vim'
alias tmux='TERM=xterm-256color tmux'
alias ll='ls -la'
alias mv='mv -i'
alias githooks='cp -r ~/.git_template/hooks/ .git/hooks/'
alias t='python ~/.t/t.py --task-dir ~/.t --list tasks'
alias sbash='source ~/.bashrc'
alias cact="conda activate $(head environment.yml | grep 'name:' | awk '{print $2}')"
alias cdea="conda deactivate"


ff() {
    grep -Iinr --color=always --exclude=*~ --exclude='./htmlcov/*' --exclude-dir='.mypy*' --exclude-dir='.build' --exclude='tags' "$1" .
}

# Custom
export PATH=$PATH:~/bin
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gosrc
export PATH=$PATH:$(go env GOPATH)/bin
export EDITOR=vim

# PS1
. ~/.git-prompt.sh

# PS1="\[\033[38;5;218m\]\u\[\033[38;5;15m\]@\[\033[38;5;161m\]\h\[\033[38;5;15m\]:"
export PS1="\w\[\033[38;5;99m\]\$(__git_ps1 \"(%s)\")\[\033[38;5;120m\]$ \[\033[0m\]"
export PS1='[$(t | wc -l | sed -e"s/ *//")]'" $PS1"

# Git
. ~/.git-completion.bash

# Bash-Completion V2
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

## Python
export PATH=~/miniconda3/bin:$PATH

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Workspaces
if [ -f ~/.config/rexhomes/rex.sh ]; then
    . ~/.config/rexhomes/rex.sh
    git config --global --unset user.signingkey
    git config --global --unset commit.gpgsign
fi

if [ -f ~/.config/arah/env.sh ]; then
    . ~/.config/arah/env.sh
fi

if [ -f ~/.config/hyunchel/env ]; then
    . ~/.config/hyunchel/env
    git config --global user.signingkey 5AB61588C2F10820
    git config --global commit.gpgsign true
fi


# Platform specific stuffs
if [ "$(uname -s)" = 'Darwin' ]; then
    alias ls='ls -G'

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


# Others

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# sorry, no zsh yet
export BASH_SILENCE_DEPRECATION_WARNING=1

# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty)
