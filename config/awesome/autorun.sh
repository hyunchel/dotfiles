#!/bin/sh
alacritty --class alacritty-monitoring -e zsh -c "ps -e && exec zsh" &
alacritty --class alacritty-monitoring -e zsh -c "htop && exec zsh" &

alacritty --class alacritty-main -e zsh -c "tmux-main && exec zsh" &
alacritty --class alacritty-code -e zsh -c "tmux-code && exec zsh" &
alacritty --class alacritty-wiki -e zsh -c "open-vimwiki && exec zsh" &

firefox -P default-release --class firefox-main &
firefox -P research-1 --class firefox-research-1 &
firefox -P research-2 --class firefox-research-2 &
firefox -P research-3 --class firefox-research-3 &
