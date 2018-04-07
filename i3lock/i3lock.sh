#!/usr/bin/env bash
set -eu

[[ -z "$(pgrep i3lock)" ]] || exit
logger "Locking screen with i3lock"

# -- takes too long to generated blurred image after suspend
# -- needs to used in conjunction with xss-lock -l trnasfer-sleep-lock.sh
SCREENSHOT_FILE=/tmp/lock-${UID}.png
LOCK_MASK_FILE=~/.config/i3lock/lock-mask.png

scrot ${SCREENSHOT_FILE}
convert ${SCREENSHOT_FILE} -blur 0x5 ${LOCK_MASK_FILE} -composite ${SCREENSHOT_FILE}

i3lock -n -i ${SCREENSHOT_FILE} -c 000000

