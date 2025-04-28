#!/bin/sh

xmodmap .Xmodmap
xrandr -s 1440x900
feh --bg-fill /home/jdev/suckless/dwm/background.png
redshift -P -O 6000

exec 
    dwm &
    st -e sh -c 'fetch -y 11 -x 48; zsh' &
    /home/jdev/suckless/dwm/time.sh
