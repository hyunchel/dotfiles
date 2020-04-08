#! /usr/bin/env bash
alias cdea="conda deactivate"

cact() {
    conda activate $(head environment.yml | grep 'name:' | awk '{print $2}')
}

ff() {
    grep -Iinr --color=always --exclude=*~ --exclude='./htmlcov/*' --exclude-dir='.mypy*' --exclude-dir='.build' --exclude='tags' "$1" .
}
