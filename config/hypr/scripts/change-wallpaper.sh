#!/bin/zsh
# Set a random wallpaper from a directory
# find ~/wallpapers/3840x2160/ -type f -name '*.jpg' -o -name '*.png' | shuf | tail -n 1 | xargs swww img \
find ~/wallpapers/5120x1440/ -type f -name '*.jpg' -o -name '*.png' | shuf | tail -n 1 | xargs swww img \
    --transition-type wipe --transition-fps 120 --transition-duration 3.0 --transition-step 90 --transition-angle 30

# Update terminal colors
swww query|awk '{print $NF}'|xargs wal -i
