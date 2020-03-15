#!/usr/bin/env python3
# -*- coding: iso-8859-15 -*-

"""
A quick script to controll screen brightness in swaywm
by directly writing into the brigtness system file
By Peleg Bar Sapir, 2020
"""

from subprocess import call, Popen, PIPE
from sys import argv


val = int(argv[1])


if __name__ == '__main__':

    # Get maximum brightness
    p = Popen(['cat', '/sys/class/backlight/intel_backlight/max_brightness'],
              stdin=PIPE, stdout=PIPE, stderr=PIPE)
    output, err = p.communicate()
    max_brightness = int(output.decode("utf-8"))

    # Calculate value of a single percent
    perc_val = int(val / 100 * max_brightness)

    # Get current brightness
    p = Popen(['cat', '/sys/class/backlight/intel_backlight/brightness'],
              stdin=PIPE, stdout=PIPE, stderr=PIPE)
    output, err = p.communicate()
    current_brightness = int(output.decode("utf-8"))

    # Add perc_val to brightness
    resulting_brightness = current_brightness + perc_val
    if resulting_brightness > max_brightness:
        output_brightness = max_brightness
    elif resulting_brightness < 0:
        output_brightness = 0
    else:
        output_brightness = resulting_brightness

    with open('/sys/class/backlight/intel_backlight/brightness', 'w') as f:
        f.write('{}'.format(output_brightness))
