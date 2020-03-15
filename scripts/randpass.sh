#!/usr/bin/env bash

if [ -z "$1" ]
  then
    N=32
  else
    N=$1
fi

if [ -z "$2" ]
  then
    pool='A-Za-z0-9!#$%&()*+,-./:;<=>?@[\]^_`{|}~'
  else
    pool=$2
fi
echo $(</dev/urandom tr -dc $pool | head -c $N)
