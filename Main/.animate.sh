#!/bin/bash

# Function to display the animation
animate() {
    local i

    for i in $(seq 0 100); do
        printf "\r\033[1;37mNext Stage... [\033[1;32m%-50s\033[1;37m] %d %%\033[0m" "$(bar $i)" "$i"
        sleep 0.1
    done
    printf "\n"
}

# Function to generate the progress bar
bar() {
    local i max=$1
    ((max = max * 50 / 100))
    for ((i=0; i<max; i++)); do echo -n '*'; done
}

# Call the animation function

