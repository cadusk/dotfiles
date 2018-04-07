#!/bin/sh

export TERMINAL=$(which urxvt)


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

# run local xhost
xhost local:host

xset -b
xset dpms 300
xset r rate 200 20
xsetroot -cursor_name left_ptr
setxkbmap -option ctrl:swapcaps

exec compton -cCG --no-fading-openclose &
exec unclutter -idle 5 -jitter 25 -root &
exec i3
