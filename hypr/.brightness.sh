#!/usr/bin/env bash


# Function to check if the brightness value is within the valid range
check_brightness_range() {
    if (( $(echo "$1 < 0.1" | bc -l) )); then
        echo 0.1
    elif (( $(echo "$1 > 1.0" | bc -l) )); then
        echo 1.0
    else
        echo $1
    fi
}

#variables
current_brightness=$(xrandr --verbose | grep -i brightness | cut -d ' ' -f 2)
monitor=$(xrandr --listmonitors | awk '{print $4}')

# Check if the script was run with an argument
if [ $# -eq 1 ]; then
    # Extract the argument provided
    operation=$1

    # Check if the argument is "increase" or "decrease"
    if [ "$operation" = "increase" ]; then
        new_brightness=$(echo "$current_brightness + 0.1" | bc)
    elif [ "$operation" = "decrease" ]; then
        new_brightness=$(echo "$current_brightness - 0.1" | bc)
    else
        echo "Usage: $0 [increase | decrease]"
        exit 1
    fi

    # Ensure the new brightness value is within the valid range
    new_brightness=$(check_brightness_range $new_brightness)

    # Set the new brightness value using xrandr
    xrandr --output $monitor --brightness $new_brightness
else
    echo "Usage: $0 [increase | decrease]"
    exit 1
fi

