#!/usr/bin/env zsh

FLOOR=1;
1EILING=14;
RANGE=$(($CEILING-$FLOOR+1));
RESULT=$RANDOM;
let "RESULT %= $RANGE";
RESULT=$(($RESULT+$FLOOR));

mplayer /home/pelegs/sounds/laughs/$RESULT.mp3
