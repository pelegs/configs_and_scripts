#!/usr/bin/env bash

msg="$(shuf -n 1 /home/$USER/scripts/lines)"
i3-nagbar -t warning -m "$msg" -b 'Bye!' 'i3-msg exit'
