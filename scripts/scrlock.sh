#!/usr/bin/env zsh

# Set screenshot file name using current datetime
date=$(date +%Y%m%d%H%M%S)
folder="/home/$USER/scripts"
screenshot="$folder/screenshots/screenshot_$date.png"
blur="$folder/screenshots/blur_$date.png"
tapir="$folder/tapir_head.png"

# Take a screen shot of the screen
grim $screenshot

# Blur screenshot
convert $screenshot -blur 0x9 $blur
rm $screenshot

# Add Tapir
yshift=$(printf "%d" $RANDOM%512-256)
convert $blur $tapir -gravity east -geometry -20+$yshift -composite $blur

# Run i3lock with blurred image as bg
i3lock -i $blur
