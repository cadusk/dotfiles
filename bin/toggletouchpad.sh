#!/bin/sh

if synclient -l | grep "TouchpadOff\s.*= 0"; then
    synclient TouchpadOff=1;
else
    synclient TouchpadOff=0;
fi

