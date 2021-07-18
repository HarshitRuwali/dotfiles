#!/bin/bash

# convert /usr/share/wallpapers/garuda-wallpapers/Dragon.png -scale 10% -scale 1000% /tmp/lockscreen.png

convert -resize $(xdpyinfo | grep dimensions | cut -d\  -f7 | cut -dx -f1) /usr/share/wallpapers/garuda-wallpapers/Dragon.png /tmp/lockscreen.png

i3lock i3lockwall -i /tmp/lockscreen.png -t
