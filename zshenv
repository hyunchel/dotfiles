. "$HOME/.cargo/env"
export PATH="$PATH:$HOME/go/bin:/usr/local/go/bin"

if [[ $(uname) == "Linux" ]]; then
    # fcitx5 integration
    # export GTK_IM_MODULE=fcitx
    # export GTK_IM_MODULE=wayland
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
fi
