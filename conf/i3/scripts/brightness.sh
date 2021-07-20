#!/bin/bash

if [ "$1" == "-h" ] || [ -z "$1" ]
then
  echo "$(basename "$0") [-h] [-b 0.6]

	where:
	    -h  show this help text
	    -b 	set the brightness"
	exit 0
fi

while getopts b: flag
do
    case "${flag}" in
        b) brightness_val=${OPTARG};;
    esac
done

# detect the primary display i.e. laptop's one and change the brightness

xrandr --output $(xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $brightness_val

