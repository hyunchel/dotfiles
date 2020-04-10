#! /usr/bin/env bash

# conda
alias cdea="conda deactivate"
cact() {
    conda activate $(head environment.yml | grep 'name:' | awk '{print $2}')
}

# venv
alias vdea="deactivate"
vact() {
    source ./venv/bin/activate
}

# misc
ff() {
    grep -Iinr --color=always --exclude=*~ --exclude='./htmlcov/*' --exclude-dir='.mypy*' --exclude-dir='.build' --exclude='tags' "$1" .
}
