# https://superuser.com/questions/544989
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

. ~/.bashrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hyunchel/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hyunchel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hyunchel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hyunchel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hyunchel/google-cloud-sdk/path.bash.inc' ]; then . '/Users/hyunchel/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hyunchel/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/hyunchel/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
