#!/usr/bin/env bash

#decrease when using d flag else increase 
brightnessctl s -P "$( [[ $1 == '-d' ]] && echo '10%-' || echo '+10%' )"

