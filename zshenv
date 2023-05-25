. "$HOME/.cargo/env"

if [[ $(uname) == "Linux" ]]; then
    # fcitx5 integration
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
fi

export RPS1=%~
