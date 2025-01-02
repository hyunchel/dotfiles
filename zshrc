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
alias tw='task waiting'
alias tin='task add +in'
# alias tobj='task add +in +obj'
export PS1='$(task +in +PENDING count) '$PS1

# tickle
ttickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tt=ttickle

# usage: tk monday Put the office plants into the sunlight
alias tk=tickle

# think should be yes/no question
# usage: th "Put the office plants into the sunlight"
alias th='tickle +1d'

# waiting for
delegate () {
    task add +waiting $@
}

# usage: td Sam - pick up the package
alias td=delegate

# move a task with waiting tag to next tag.
ping_waiting () {
    task $1 modify -waiting +next
}

# usage: tdn 23
alias tdn=ping_waiting

# move a task with next tag to waiting tag.
redelegate () {
    task $1 modify -next +waiting
}

# usage: tdr 23
alias tdr=redelegate

# R&D; look into something
# usage: trnd "look into this"
alias trnd='task add +rnd +next +@computer +@online'

# read and review a webpage
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

# usage: trnr "https://example.com/some-article"
alias trnr=read_and_review

# print help
# usage: thelp
print_help (){
    echo "thelp: print this help"
    echo "t: list next actions"
    echo "tw: list waiting for"
    echo "tk monday water plant: tickle a task for monday"
    echo "th buy a gym membership?: tickle a yes/no question for tomorrow"
    echo "td Sam - carry the ring until he's okay: delegate a task"
    echo "tdn 23: move waiting task #23 to next action"
    echo "tdr 23: move next action task #23 to waiting"
    echo "trnd emacs vs vim?: R&D; look into something"
    echo "trnr https://some.url.to.article: read and review a webpage"
}
alias thelp=print_help

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
    alias timew='TIMEWARRIORDB=/Users/hyunchelkim/Dropbox/timewarrior timew'
fi

if [[ $(uname) == "Darwin" ]]; then
    alias timew='TIMEWARRIORDB=/home/gnis/Dropbox/timewarrior timew'
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
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
ZSH_GIT_PROMPT_ENABLE_SECONDARY=1
ZSH_GIT_PROMPT_SHOW_STASH=1
ZSH_GIT_PROMPT_FORCE_BLANK=1
ZSH_GIT_PROMPT_SHOW_UPSTREAM="no"
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="] "
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

PROMPT='%B%40<..<%~ %b$(gitprompt)'
PROMPT+='%(?.%(!.%F{white}❯%F{yellow}❯%F{red}.%F{blue}❯%F{cyan}❯%F{green})❯.%F{red}❯❯❯)%f '
RPROMPT='%F{yellow}$(task end.after:today-3d count)%F{white}/%F{white}$(task +next +PENDING count)%F{white}/%F{white}$(task +in +PENDING count)'
fpath+=${ZDOTDIR:-~}/.zsh_functions

# export PROMPT='$(gitprompt)'

# z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
[[ -r "$HOME/.zsh/zsh-z.plugin.zsh" ]] && source "$HOME/.zsh/zsh-z.plugin.zsh"

# pywal
# (cat ~/.cache/wal/sequences &)
# source ~/.cache/wal/colors-tty.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gnis/code/google-cloud-sdk/path.zsh.inc' ]; then . '/home/gnis/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gnis/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/gnis/code/google-cloud-sdk/completion.zsh.inc'; fi

# opam configuration
[[ ! -r /home/gnis/.opam/opam-init/init.zsh ]] || source /home/gnis/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
