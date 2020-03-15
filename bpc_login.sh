#!/usr/bin/expect

spawn openconnect vpn.mpibpc.mpg.de/webVPN
expect "Username:"
send "psapir@mpibpc.mpg.de\r"
interact
