#!/bin/bash
#



#Battery notifications
while true; do
level=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$level" -lt 15 ]; then
	dunstify "  Battery Low"
elif [ "$level" -lt 5 ]; then
	dunstify "  Battery Critial"
fi
sleep 300
done

#if you want to kill the notifications then run $ kill $(pgrep -f notifications.sh)
#
