#!/usr/bin/env bash

options="default setup"

selectedOption=$(echo "$options" | wofi --show dmenu)

if [[ $selectedOption == "default setup" ]];then
	 exec default-setup
fi
