# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

export PROMPT="%1~ %(?.%F{green}%#%f.%F{red}%#%f) "

# alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vim='nvim'
alias tmux='TERM=xterm-256color tmux'
alias ll='ls -la'
alias mv='mv -i'

# colors
export LESS='-R --use-color -Dd+r$Du+b'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias ls='ls --color=auto'

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zfunc?
fpath+=~/.zfunc
autoload -Uz compinit && compinit

export GPG_TTY=$(tty)

# autoload ssh agnet
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

# exports
export EDITOR=vim

if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin:/usr/local/go/bin"
export PATH="$PATH:/$HOME/.foundry/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubectl
export SAVED_KUBECONFIG=${KUBECONFIG}
export KUBECONFIG=${HOME}/.kube/vke-279cf2c8-9430-46fe-8ff1-6b80bec45f66.yaml:${HOME}/.kube/vke-85d695e9-e0cd-4a0d-ac5d-63112e4f5882.yaml:${HOME}/.kube/vke-c1f6be16-6876-4ac3-80c0-229a91dfe005.yaml
alias k='kubectl'
