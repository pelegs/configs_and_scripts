#!/usr/bin/env bash

# Executes command in 'cmd' N times

cmd="${@:2}"
N=$1
for i in $(seq 1 1 $N)
do
    $cmd
done
