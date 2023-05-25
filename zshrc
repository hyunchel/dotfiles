alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vim='nvim'
alias tmux='TERM=xterm-256color tmux'
alias ll='ls -la'

export EDITOR=vim

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/$HOME/.foundry/bin"

export NVM_DIR="$HOME/.nvm"

export GPG_TTY=$(tty)
