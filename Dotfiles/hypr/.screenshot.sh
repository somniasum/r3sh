#!/usr/bin/env bash

# Ensure that the script gets executed with one of the expected flags
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {full|window|select}"
    exit 1
fi

flag=$1
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
screenshot="/home/$USER/Pictures/Screenshots/screenshot_$timestamp.png"

notification="Screenshot Captured"

case $flag in
    full)
        maim "$screenshot"
        notify-send "$notification"
        ;;
    window)
        maim --window "$(xdotool getactivewindow)" "$screenshot"
        notify-send "$notification"
        ;;
    select)
        maim --select "$screenshot"
        notify-send "$notification"
        ;;
    *)
        echo "Invalid flag: $flag"
        echo "Usage: $0 {full|window|select}"
        exit 1
        ;;
esac

