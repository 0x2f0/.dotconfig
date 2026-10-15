#!/usr/bin/env bash

set -e
increase=$1

if [[ "$increase" == 'true' ]];then
	brightnessctl set +10%
	ddcutil setvcp 10 + 10
else 
	brightnessctl set 10%-
	ddcutil setvcp 10 - 10
fi
