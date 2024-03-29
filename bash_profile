# https://superuser.com/questions/544989
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

. ~/.bashrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hyunchelkim/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hyunchelkim/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/hyunchelkim/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hyunchelkim/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hyunchelkim/code/google-cloud-sdk/path.bash.inc' ]; then . '/Users/hyunchelkim/code/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hyunchelkim/code/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/hyunchelkim/code/google-cloud-sdk/completion.bash.inc'; fi
