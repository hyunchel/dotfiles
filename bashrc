# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias vi='vim'

# added by Miniconda2 4.3.21 installer
# export PATH="/Users/hyunchel/Development/miniconda2/bin:$PATH"
# added by Miniconda3 installer
export PATH="/Users/hyunchelkim/miniconda3/bin:$PATH"

# export PATH="/usr/local/opt/node@6/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Custom GOPATH
export GOPATH=$HOME/Development/golang
export PATH=$PATH:$(go env GOPATH)/bin

# rbenv
eval "$(rbenv init -)"

