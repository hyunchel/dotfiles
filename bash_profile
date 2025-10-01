# https://superuser.com/questions/544989
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

. ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hyunchel/code/google-cloud-sdk/path.bash.inc' ]; then . '/Users/hyunchel/code/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hyunchel/code/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/hyunchel/code/google-cloud-sdk/completion.bash.inc'; fi
