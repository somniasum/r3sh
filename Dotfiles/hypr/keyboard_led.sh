#!/usr/bin/env bash
#author: somniasum

## use 'sudo chmod a+rw /sys/class/leds/<device-name>/brightness' to be able to toggle without sudo
DEVICE_NAME=$(ls /sys/class/leds/ | grep scrolllock | sed -n '2p')

LED_PATH="/sys/class/leds/$DEVICE_NAME/brightness"

sudo chmod a+rw $LED_PATH

STATE=$(cat $LED_PATH)

# Toggle the LED
if [[ $STATE -eq 1 ]]; then
	echo 0 > $LED_PATH # turn off 
else
	echo 1 > $LED_PATH # turn on
fi
