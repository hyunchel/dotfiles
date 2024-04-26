# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# alias
alias ..='cd ..;ll'
alias ...='cd ../..;ll'
alias ....='cd ../../../;ll'
alias vim='nvim'
alias v='vim'
alias ll='ls -la'
alias mv='mv -i'
alias python='python3'
# taskwarrior
alias t='task'
alias tin='task add +in'
export PS1='$(task +in +PENDING count) '$PS1

# tickle
tickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tt=tickle

# usage: tick monday Put the office plants into the sunlight
# alias think='tickle +1d'

# link
webpage_title (){
    wget -qO- "$*" | hxselect -s '\n' -c  'title' 2>/dev/null
}

read_and_review (){
    link="$1"
    title=$(webpage_title $link)
    echo $title
    descr="\"Read and review: $title\""
    id=$(task add +next +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
    task "$id" annotate "$link"
}

alias trnr=read_and_review
# look into something
alias trnd='task add +rnd +next +@computer +@online'


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

if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin:/usr/local/go/bin"
export PATH="$PATH:$HOME/.foundry/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh git prompt
export ZSH_GIT_PROMPT_ENABLE_SECONDARY=1
export ZSH_GIT_PROMPT_SHOW_STASH=1
export ZSH_GIT_PROMPT_FORCE_BLANK=1
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# zksync
export ZKSYNC_HOME=$HOME/code/zksync-era
export PATH=$ZKSYNC_HOME/bin:$PATH

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
[[ -r "$HOME/.zsh/zsh-z.plugin.zsh" ]] && source "$HOME/.zsh/zsh-z.plugin.zsh"

export NARGO_HOME="$HOME/.nargo"
export PATH="$PATH:$NARGO_HOME/bin"

# pywal
# (cat ~/.cache/wal/sequences &)
# source ~/.cache/wal/colors-tty.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gnis/code/google-cloud-sdk/path.zsh.inc' ]; then . '/home/gnis/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gnis/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/gnis/code/google-cloud-sdk/completion.zsh.inc'; fi
