#!/usr/bin/env bash
#author: somniasum


if [ $1 == "-o" ]; then
	xset led
elif [ $1 == "-p" ]; then
	xset -led
fi




