#!/usr/bin/env bash

yes | sudo apt update
yes | sudo apt upgrade
yes | sudo apt dist-upgrade

i3 restart
