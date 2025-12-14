#!/bin/bash

input=$1
input+=' *-'
checkSums=0
intLoop=0


if [ -z "$1" ]; then
	echo "No argument detected."
	exit
fi

while [[ $intLoop -lt 100000 ]]; do
	checkSums=$(printf "%05d" $intLoop | md5sum -b)
	if [ "$checkSums" = "$input" ]; then
		echo "The pin corresponding to "$1" is $(printf "%05d" $intLoop)"
		sleep 1
		exit; else
		progress=$((intLoop + 1))
		(( progress % 500 == 0 )) && echo -ne "Cracks Attempted: $progress\r"
	fi
	((intLoop++)) # This is the same as 'intLoop=$((intLoop+1))
done

if [[ $intLoop -gt 0 ]]; then
	echo "Something went wrong; No match found..."
	fi
exit
