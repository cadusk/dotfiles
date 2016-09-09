#!/bin/sh
# Sets right perspective when monitor is plugged in.
# Needed by udev rule /etc/udev/rules.d/95-hotplug-monitor.rules

export BUILTIN="eDP-1"
export EXTERNAL="HDMI-1"

connect() {
    xrandr --output ${EXTERNAL} --above ${BUILTIN} --preferred --primary --output ${BUILTIN} --preferred
}

disconnect() {
    xrandr --output ${BUILTIN} --auto
    xrandr --output ${EXTERNAL} --off
}

xrandr | grep "${EXTERNAL} connected" &> /dev/null && connect || disconnect
[ -f "$HOME/.fehbg" ] && sh $HOME/.fehbg
