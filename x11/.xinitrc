#!/bin/sh

export TERMINAL=$(which lxterminal)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# run local xhost
xhost local:host

xset -b &
xset +fp /usr/share/fonts/local
xset fp rehash &
xsetroot -cursor_name left_ptr &

#exec xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
exec compton -cCG &
exec unclutter -idle 5 -jitter 25 -root &
exec pulseaudio --start &
exec xscreensaver -no-splash &
exec i3
