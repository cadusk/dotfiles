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
[ -f "$userresources" ] && xrdb -load "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

# run local xhost
xhost local:host

xset -b
xset dpms 300
xset r rate 400 20
xsetroot -cursor_name left_ptr
setxkbmap -model pc105 -layout us,us -variant ,intl
setxkbmap -option ctrl:nocaps -option grp:shifts_toggle

exec dunst &
exec xss-lock -- ~/.config/i3lock/i3lock.sh &
exec compton -cCG --no-fading-openclose &
exec unclutter -idle 5 -jitter 25 -root &
exec i3
