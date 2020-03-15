#!/usr/bin/env zsh

requested=$1
perc=$(bc -l <<< $requested*9.37)
brightness=${perc%.*}
echo $brightness > /sys/class/backlight/intel_backlight/brightness
