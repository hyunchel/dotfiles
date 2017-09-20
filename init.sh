#!/usr/bin/env bash

# Enable dotfiles.
cp ./vimrc ~/.vimrc
cp ./tmux.conf ~/.tmux.conf
cp ./gitconfig ~/.gitconfig

# Move VIM
cp -r ./vim ~/.vim/

# Enable OMZ custom scripts if possible.
if [$ZSH -eq ""]
then
    cat ./custom/*.zsh >> bashrc
    cp ./bashrc ~/.bashrc
else
    # Move all OMZ custom files into OMZ directory.
    cp ./custom/*.zsh $ZSH/custom/
fi

